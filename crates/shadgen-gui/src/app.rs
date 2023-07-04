use iced::{subscription, widget, Command, Length, Renderer, Subscription, Theme};

use crate::logs::Logs;

#[derive(Debug, Default)]
pub struct Application {
    logs: Logs,
}

impl iced::Application for Application {
    type Executor = iced::executor::Default;
    type Message = Message;
    type Theme = Theme;
    type Flags = ();

    fn new(_flags: ()) -> (Self, Command<Message>) {
        let mut app = Application::default();
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
                return iced::window::close();
            }
            Message::Event(_) => {}
            Message::Clicked => {
                self.logs.push("Clicked!");
            }
        }

        Command::none()
    }

    fn view(&self) -> iced::Element<'_, Message, Renderer> {
        let button = widget::button("Click Me").on_press(Message::Clicked);
        let body = widget::container("x")
            .height(Length::Fill)
            .width(Length::Fill);
        widget::column![button, body, self.logs.view(),].into()
    }

    fn subscription(&self) -> Subscription<Self::Message> {
        subscription::events().map(Message::Event)
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum Message {
    Event(iced::Event),
    Clicked,
}
