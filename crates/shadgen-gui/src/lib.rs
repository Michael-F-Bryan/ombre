use std::path::PathBuf;

use directories::ProjectDirs;
use iced::{widget::text, Theme};
use once_cell::sync::Lazy;

pub static DIRECTORIES: Lazy<ProjectDirs> =
    Lazy::new(|| ProjectDirs::from("com", "michaelfbryan", env!("CARGO_PKG_NAME")).unwrap());

pub fn log_file() -> PathBuf {
    DIRECTORIES.data_local_dir().join("shadgen.log")
}

#[derive(Debug, Default)]
pub struct Application {}

impl iced::Application for Application {
    type Executor = iced::executor::Default;
    type Message = Message;
    type Theme = Theme;
    type Flags = ();

    fn new(_flags: ()) -> (Self, iced::Command<Message>) {
        (Application::default(), iced::Command::none())
    }

    fn title(&self) -> String {
        let version = env!("CARGO_PKG_VERSION");
        format!("Shadgen {version}")
    }

    fn update(&mut self, _message: Message) -> iced::Command<Message> {
        todo!()
    }

    fn view(&self) -> iced::Element<'_, Message, iced::Renderer<Theme>> {
        text("Hello, World!").into()
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum Message {}
