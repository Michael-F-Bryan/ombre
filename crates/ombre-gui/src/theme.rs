use std::ops::Deref;

use iced::{
    application,
    widget::{button, container, rule, scrollable, text, text_input},
};
use iced_aw::{card, menu, modal, style::tab_bar};

/// A custom theme used throughout the application.
#[derive(Debug, Default, Clone)]
pub struct Theme(iced::Theme);

impl Deref for Theme {
    type Target = iced::Theme;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl application::StyleSheet for Theme {
    type Style = <iced::Theme as application::StyleSheet>::Style;

    fn appearance(&self, style: &Self::Style) -> application::Appearance {
        self.0.appearance(style)
    }
}

impl text::StyleSheet for Theme {
    type Style = <iced::Theme as text::StyleSheet>::Style;

    fn appearance(&self, style: Self::Style) -> text::Appearance {
        self.0.appearance(style)
    }
}

impl container::StyleSheet for Theme {
    type Style = <iced::Theme as container::StyleSheet>::Style;

    fn appearance(&self, style: &Self::Style) -> container::Appearance {
        self.0.appearance(style)
    }
}

impl rule::StyleSheet for Theme {
    type Style = <iced::Theme as rule::StyleSheet>::Style;

    fn appearance(&self, style: &Self::Style) -> rule::Appearance {
        self.0.appearance(style)
    }
}

impl iced_aw::tab_bar::StyleSheet for Theme {
    type Style = <iced::Theme as iced_aw::tab_bar::StyleSheet>::Style;

    fn active(&self, style: Self::Style, is_active: bool) -> tab_bar::Appearance {
        self.0.active(style, is_active)
    }

    fn hovered(&self, style: Self::Style, is_active: bool) -> tab_bar::Appearance {
        self.0.hovered(style, is_active)
    }
}

impl button::StyleSheet for Theme {
    type Style = <iced::Theme as button::StyleSheet>::Style;

    fn active(&self, style: &Self::Style) -> iced_native::widget::button::Appearance {
        self.0.active(style)
    }

    fn hovered(&self, style: &Self::Style) -> button::Appearance {
        self.0.hovered(style)
    }

    fn pressed(&self, style: &Self::Style) -> button::Appearance {
        self.0.pressed(style)
    }

    fn disabled(&self, style: &Self::Style) -> button::Appearance {
        self.0.disabled(style)
    }
}

impl card::StyleSheet for Theme {
    type Style = <iced::Theme as card::StyleSheet>::Style;

    fn active(&self, style: Self::Style) -> card::Appearance {
        self.0.active(style)
    }
}

impl text_input::StyleSheet for Theme {
    type Style = <iced::Theme as text_input::StyleSheet>::Style;

    fn active(&self, style: &Self::Style) -> text_input::Appearance {
        self.0.active(style)
    }

    fn focused(&self, style: &Self::Style) -> text_input::Appearance {
        self.0.focused(style)
    }

    fn placeholder_color(&self, style: &Self::Style) -> iced_native::Color {
        self.0.placeholder_color(style)
    }

    fn value_color(&self, style: &Self::Style) -> iced_native::Color {
        self.0.value_color(style)
    }

    fn disabled_color(&self, style: &Self::Style) -> iced_native::Color {
        self.0.disabled_color(style)
    }

    fn selection_color(&self, style: &Self::Style) -> iced_native::Color {
        self.0.selection_color(style)
    }

    fn disabled(&self, style: &Self::Style) -> text_input::Appearance {
        self.0.disabled(style)
    }

    fn hovered(&self, style: &Self::Style) -> text_input::Appearance {
        self.0.hovered(style)
    }
}

impl modal::StyleSheet for Theme {
    type Style = <iced::Theme as modal::StyleSheet>::Style;

    fn active(&self, style: Self::Style) -> iced_aw::style::modal::Appearance {
        self.0.active(style)
    }
}

impl scrollable::StyleSheet for Theme {
    type Style = <iced::Theme as scrollable::StyleSheet>::Style;

    fn active(&self, style: &Self::Style) -> scrollable::Scrollbar {
        self.0.active(style)
    }

    fn hovered(&self, style: &Self::Style, is_mouse_over_scrollbar: bool) -> scrollable::Scrollbar {
        self.0.hovered(style, is_mouse_over_scrollbar)
    }

    fn dragging(&self, style: &Self::Style) -> scrollable::Scrollbar {
        self.0.dragging(style)
    }

    fn active_horizontal(&self, style: &Self::Style) -> scrollable::Scrollbar {
        self.0.active_horizontal(style)
    }

    fn hovered_horizontal(
        &self,
        style: &Self::Style,
        is_mouse_over_scrollbar: bool,
    ) -> scrollable::Scrollbar {
        self.0.hovered_horizontal(style, is_mouse_over_scrollbar)
    }

    fn dragging_horizontal(&self, style: &Self::Style) -> scrollable::Scrollbar {
        self.0.dragging_horizontal(style)
    }
}

impl menu::StyleSheet for Theme {
    type Style = <iced::Theme as menu::StyleSheet>::Style;

    fn appearance(&self, style: &Self::Style) -> menu::Appearance {
        self.0.appearance(style)
    }
}
