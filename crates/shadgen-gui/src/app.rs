use std::path::PathBuf;

use iced::{subscription, widget, Command, Length, Renderer, Subscription, Theme};

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
        let config_file = flags.config_dir.join("shadgen.toml");
        let cfg = match Config::load(&config_file) {
            Ok(c) => c,
            Err(e) => {
                tracing::error!(
                    path=%config_file.display(),
                    error=&*e,
                    "Unable to load the config file",
                );
                Config::default()
            }
        };

        let mut app = Application {
            logs: Logs::default(),
            settings: SettingsPage::new(cfg),
            show_settings: false,
        };

        tracing::info!("Started");
        app.logs.push("Started");

        (app, Command::none())
    }

    fn title(&self) -> String {
        let version = env!("CARGO_PKG_VERSION");
        format!("Shadgen {version}")
    }

    fn update(&mut self, message: Message) -> Command<Message> {
        match message {
            Message::Event(iced::Event::Window(iced::window::Event::CloseRequested)) => {
                tracing::info!("Shutting down");
                iced::window::close()
            }
            Message::Event(_) => Command::none(),
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
        let menu = widget::row![widget::button("Settings").on_press(Message::OpenSettings)];

        let body = widget::container("x")
            .height(Length::Fill)
            .width(Length::Fill);
        let content = widget::column![menu, body, self.logs.view()];

        if self.show_settings {
            Modal::new(content, self.settings.view().map(Message::Settings))
                .on_blur(Message::CloseSettings)
                .into()
        } else {
            content.into()
        }
    }

    fn subscription(&self) -> Subscription<Self::Message> {
        subscription::events().map(Message::Event)
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum Message {
    Event(iced::Event),
    Settings(crate::settings::Message),
    OpenSettings,
    CloseSettings,
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
