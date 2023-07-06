mod app;
mod config;
mod logs;
pub(crate) mod settings;
mod theme;

pub use crate::{
    app::{Application, Flags, Message},
    config::{log_file, DIRECTORIES},
    theme::Theme,
};

pub type Element<'a, Msg = Message> = iced::Element<'a, Msg, iced::Renderer<Theme>>;
