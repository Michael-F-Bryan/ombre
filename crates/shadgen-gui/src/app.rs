use std::path::PathBuf;

use iced::{
    subscription,
    widget::{self, button},
    Color, Command, Length, Renderer, Subscription, Theme,
};
use iced_aw::menu::{MenuBar, MenuTree};

use crate::{config::Config, logs::Logs, modal::Modal, settings::SettingsPage};

#[derive(Debug)]
pub struct Application {
    logs: Logs,
    settings: SettingsPage,
    show_settings: bool,
}

impl iced::Application for Application {
    type Executor = iced::executor::Default;
    type Message = Message;
    type Theme = Theme;
    type Flags = Flags;

    fn new(flags: Flags) -> (Self, Command<Message>) {
        let mut logs = Logs::default();
        logs.push("Started");

        let config_file = flags.config_dir.join("shadgen.toml");
        let cfg = match Config::load(&config_file) {
            Ok(config) => {
                tracing::debug!(path=%config_file.display(), "Loaded config");
                tracing::trace!(?config);
                config
            }
            Err(e) => {
                tracing::error!(
                    path=%config_file.display(),
                    error=&*e,
                    "Unable to load the config file",
                );
                logs.push(format!("Unable to load the config file: {e}"));
                Config::default()
            }
        };

        let app = Application {
            logs,
            settings: SettingsPage::new(cfg),
            show_settings: false,
        };

        tracing::info!("Started");

        (app, Command::none())
    }

    fn title(&self) -> String {
        let version = env!("CARGO_PKG_VERSION");
        format!("Shadgen {version}")
    }

    fn update(&mut self, message: Message) -> Command<Message> {
        match message {
            Message::Event(iced::Event::Window(iced::window::Event::CloseRequested))
            | Message::Exit => {
                tracing::info!("Shutting down");
                iced::window::close()
            }
            Message::Event(_) => Command::none(),
            Message::Log(msg) => {
                self.logs.push(msg);
                Command::none()
            }
            Message::OpenSettings => {
                self.logs.push("Opening settings");
                self.show_settings = true;
                Command::none()
            }
            Message::CloseSettings => {
                self.logs.push("Closing settings");
                self.show_settings = false;
                Command::none()
            }
            Message::Settings(msg) => self.settings.update(msg).map(Message::Settings),
        }
    }

    fn view(&self) -> iced::Element<'_, Message, Renderer> {
        let body = widget::container("x")
            .height(Length::Fill)
            .width(Length::Fill);
        let mut content = iced::Element::from(widget::column![menu(), body, self.logs.view()]);

        if self.show_settings {
            content = Modal::new(content, self.settings.view().map(Message::Settings))
                .on_blur(Message::CloseSettings)
                .into();
        }

        content
    }

    fn subscription(&self) -> Subscription<Self::Message> {
        subscription::events().map(Message::Event)
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum Message {
    Event(iced::Event),
    /// Add an event to the log viewer.
    Log(String),
    Settings(crate::settings::Message),
    OpenSettings,
    CloseSettings,
    Exit,
}

#[derive(Debug, Clone, PartialEq)]
pub struct Flags {
    pub config_dir: PathBuf,
}

impl Default for Flags {
    fn default() -> Self {
        Self {
            config_dir: crate::DIRECTORIES.config_dir().to_path_buf(),
        }
    }
}

fn menu() -> iced::Element<'static, Message, Renderer> {
    let file_menu = MenuTree::with_children(
        widget::container(widget::text("File"))
            .padding([4, 8])
            .style(menu_button_style as fn(&Theme) -> _),
        vec![
            MenuTree::new(base_button("Settings", Message::OpenSettings)),
            MenuTree::new(base_button("Quit", Message::Exit)),
        ],
    );

    MenuBar::new(vec![file_menu]).width(Length::Fill).into()
}

fn menu_button_style(theme: &Theme) -> widget::container::Appearance {
    let palette = theme.extended_palette();

    widget::container::Appearance {
        background: Some(palette.background.weak.color.into()),
        border_color: palette.background.strong.color,
        ..Default::default()
    }
}

struct ButtonStyle;

impl button::StyleSheet for ButtonStyle {
    type Style = iced::Theme;

    fn active(&self, style: &Self::Style) -> button::Appearance {
        button::Appearance {
            text_color: style.extended_palette().background.base.text,
            border_radius: 4.0,
            background: Some(Color::TRANSPARENT.into()),
            ..Default::default()
        }
    }

    fn hovered(&self, style: &Self::Style) -> button::Appearance {
        let plt = style.extended_palette();

        button::Appearance {
            background: Some(plt.primary.weak.color.into()),
            text_color: plt.primary.weak.text,
            ..self.active(style)
        }
    }
}

fn base_button<'a>(
    content: impl Into<iced::Element<'a, Message, iced::Renderer>>,
    msg: Message,
) -> button::Button<'a, Message, iced::Renderer> {
    button(content)
        .padding([4, 8])
        .style(iced::theme::Button::Custom(Box::new(ButtonStyle)))
        .on_press(msg)
}
