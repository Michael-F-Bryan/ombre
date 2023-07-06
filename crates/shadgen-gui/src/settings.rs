use camino::Utf8PathBuf;
use iced::{
    widget::{self, button},
    Alignment, Length, Renderer,
};
use iced_aw::Card;

use crate::config::Config;

/// Render the settings page.
pub fn settings(state: &SettingsState) -> iced::Element<'static, Message, Renderer> {
    let config = match &state.config {
        Some(cfg) => cfg,
        None => return widget::text("").into(),
    };

    let Config {
        radio_mobile_exe,
        srtm_path,
    } = config;

    let fields = [
        (
            widget::text("Radio Mobile"),
            widget::text_input("rmweng.exe", radio_mobile_exe.as_str())
                .on_input(|p| Message::Update(Update::RadioMobileExe(p.into()))),
        ),
        (
            widget::text("SRTM"),
            widget::text_input("", srtm_path.as_str())
                .on_input(|p| Message::Update(Update::SrtmPath(p.into()))),
        ),
    ];

    let fields = fields
        .into_iter()
        .map(|(label, input)| {
            widget::row![label, input]
                .spacing(10)
                .align_items(Alignment::Center)
                .into()
        })
        .collect();

    let title = widget::text("Settings");

    let save = button(widget::text("Save"))
        .on_press(Message::SaveSettings(config.clone()))
        .style(iced::theme::Button::Primary)
        .padding(20);

    let cancel = button(widget::text("Cancel"))
        .on_press(Message::Cancel)
        .style(iced::theme::Button::Secondary)
        .padding(20);

    Card::new(title, widget::column(fields))
        .foot(
            widget::row![
                widget::horizontal_space(Length::Fill),
                save,
                cancel,
                widget::horizontal_space(Length::Fill),
            ]
            .spacing(20)
            .align_items(Alignment::Center),
        )
        .padding(20.0)
        .into()
}

/// State for the settings widget.
#[derive(Debug, Default, Clone, PartialEq)]
pub struct SettingsState {
    config: Option<Config>,
}

impl SettingsState {
    pub fn show(&mut self, config: Config) {
        self.config = Some(config);
    }

    pub fn close(&mut self) {
        self.config = None;
    }

    pub fn is_visible(&self) -> bool {
        self.config.is_some()
    }

    pub fn update(&mut self, update: Update) {
        let cfg = self.config.as_mut().expect("Can only update when visible");

        match update {
            Update::RadioMobileExe(p) => cfg.radio_mobile_exe = p,
            Update::SrtmPath(p) => cfg.srtm_path = p,
        }
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum Message {
    /// Save the settings.
    SaveSettings(Config),
    /// Close the settings dialog, leaving them unchanged.
    Cancel,
    Update(Update),
}

#[derive(Debug, Clone, PartialEq)]
pub enum Update {
    RadioMobileExe(Utf8PathBuf),
    SrtmPath(Utf8PathBuf),
}
