use iced::{
    widget::{self, button},
    Color, Command, Length, Renderer, Theme,
};
use iced_aw::{
    menu::{MenuBar, MenuTree},
    Modal,
};

use crate::{
    config::Config,
    logs::Logs,
    settings::{self, settings, SettingsState},
};

#[derive(Debug)]
pub struct Application {
    config: Config,
    logs: Logs,
    settings: SettingsState,
}

impl iced::Application for Application {
    type Executor = iced::executor::Default;
    type Message = Message;
    type Theme = Theme;
    type Flags = Flags;

    fn new(_flags: Flags) -> (Self, Command<Message>) {
        let mut logs = Logs::default();
        logs.push("Started");

        let config_file = Config::filename();
        let config = match Config::load(&config_file) {
            Ok(config) => {
                tracing::info!(path=%config_file.display(), "Loaded config");
                tracing::debug!(?config);
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
            settings: SettingsState::default(),
            config,
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
            Message::Quit => {
                tracing::info!("Shutting down");
                return iced::window::close();
            }
            Message::Log(msg) => {
                self.logs.push(msg);
            }
            Message::OpenSettings => {
                self.logs.push("Opening settings");
                self.settings.show(self.config.clone());
            }
            Message::Settings(crate::settings::Message::SaveSettings(config)) => {
                let config_file = Config::filename();
                match config.save(&config_file) {
                    Ok(_) => {
                        tracing::info!(
                            config.path=%config_file.display(),
                            "Config saved",
                        );
                        tracing::debug!(?config);
                        self.logs.push("Settings saved");
                    }
                    Err(e) => {
                        tracing::error!(
                            error=&*e,
                            config.path=%config_file.display(),
                            "Unable to save the config",
                        );
                        self.logs.push(format!("Unable to save settings: {e}"));
                    }
                }

                self.config = config;
                self.settings.close();
            }
            Message::Settings(crate::settings::Message::Cancel) => {
                self.logs.push("Leaving settings unmodified");
                self.settings.close();
            }

            Message::Settings(crate::settings::Message::Update(update)) => {
                self.settings.update(update);
            }
        }

        Command::none()
    }

    fn view(&self) -> iced::Element<'_, Message, Renderer> {
        let content = iced::Element::from(widget::column![
            menu(),
            widget::vertical_space(Length::Fill),
            self.logs.view()
        ]);

        Modal::new(self.settings.is_visible(), content, || {
            settings(&self.settings).map(Message::Settings)
        })
        .on_esc(Message::Settings(settings::Message::Cancel))
        .backdrop(Message::Settings(settings::Message::Cancel))
        .into()
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum Message {
    /// Add an event to the log viewer.
    Log(String),
    Settings(crate::settings::Message),
    OpenSettings,
    Quit,
}

#[derive(Debug, Default, Clone, PartialEq)]
pub struct Flags {}

fn menu() -> iced::Element<'static, Message, Renderer> {
    let file_menu = MenuTree::with_children(
        widget::container(widget::text("File"))
            .padding([4, 8])
            .style(menu_button_style as fn(&Theme) -> _),
        vec![
            MenuTree::new(base_button("Settings", Message::OpenSettings)),
            MenuTree::new(base_button("Quit", Message::Quit)),
        ],
    );

    MenuBar::new(vec![file_menu]).width(Length::Shrink).into()
}

fn menu_button_style(theme: &Theme) -> widget::container::Appearance {
    let palette = theme.extended_palette();

    widget::container::Appearance {
        background: Some(palette.background.weak.color.into()),
        border_color: palette.background.strong.color,
        ..Default::default()
    }
}

struct MenuButtonStyle;

impl button::StyleSheet for MenuButtonStyle {
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
        .style(iced::theme::Button::Custom(Box::new(MenuButtonStyle)))
        .on_press(msg)
}
