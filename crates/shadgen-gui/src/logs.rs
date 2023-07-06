use chrono::{DateTime, Local};
use iced::{
    widget::{self, container},
    Color, Element, Length, Renderer, Theme,
};

use crate::Message;

/// A simple, scrollable log viewer.
#[derive(Debug, Default, Clone, PartialEq)]
pub(crate) struct Logs {
    logs: Vec<LogItem>,
}

impl Logs {
    pub fn push(&mut self, message: impl Into<String>) {
        self.logs.push(LogItem {
            timestamp: Local::now(),
            message: message.into(),
        });
    }

    pub fn view(&self) -> Element<'_, Message, Renderer> {
        let messages = self.logs.iter().rev().map(|msg| msg.view()).collect();
        let scroll_box = widget::scrollable(widget::column(messages));
        container(scroll_box)
            .style(logs_style as fn(&Theme) -> _)
            .height(100)
            .into()
    }
}

fn logs_style(theme: &Theme) -> container::Appearance {
    let palette = theme.extended_palette();

    container::Appearance {
        background: Some(palette.background.weak.color.into()),
        border_width: 2.0,
        border_color: palette.background.strong.color,
        ..Default::default()
    }
}

#[derive(Debug, Clone, PartialEq)]
struct LogItem {
    timestamp: DateTime<Local>,
    message: String,
}

impl LogItem {
    fn view(&self) -> Element<'_, Message, Renderer<Theme>> {
        let timestamp = widget::text(self.timestamp.format("%Y-%m-%d %H:%M:%S").to_string())
            .style(Color::BLACK);

        widget::row![
            widget::container(timestamp).padding([0, 5]),
            widget::text(&self.message),
        ]
        .spacing(10)
        .padding(3)
        .width(Length::Fill)
        .into()
    }
}
