use iced::{widget, Command, Renderer, Theme};

use crate::config::Config;

#[derive(Debug, Clone, PartialEq)]
pub struct SettingsPage {
    current: Config,
}

impl SettingsPage {
    pub fn new(config: Config) -> Self {
        SettingsPage { current: config }
    }

    pub fn config(&self) -> &Config {
        &self.current
    }

    pub fn update(&mut self, message: Message) -> Command<Message> {
        todo!();
    }

    pub fn view(&self) -> iced::Element<'static, Message, Renderer> {
        let content = widget::column![widget::text("Settings")]
            .padding(20)
            .align_items(iced::Alignment::Center);

        widget::container(content)
            .style(settings_style as fn(&Theme) -> _)
            .into()
    }
}

fn settings_style(theme: &Theme) -> widget::container::Appearance {
    let palette = theme.extended_palette();

    widget::container::Appearance {
        background: Some(palette.background.weak.color.into()),
        border_color: palette.background.strong.color,
        ..Default::default()
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum Message {
    UpdateSettings,
    Cancel,
}
