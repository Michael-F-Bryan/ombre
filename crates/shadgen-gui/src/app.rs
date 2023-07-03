use iced::{subscription, widget::text, Command, Subscription, Theme};

#[derive(Debug, Default)]
pub struct Application {}

impl iced::Application for Application {
    type Executor = iced::executor::Default;
    type Message = Message;
    type Theme = Theme;
    type Flags = ();

    fn new(_flags: ()) -> (Self, Command<Message>) {
        (Application::default(), Command::none())
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
            _ => Command::none(),
        }
    }

    fn view(&self) -> iced::Element<'_, Message, iced::Renderer<Theme>> {
        text("Hello, World!").into()
    }

    fn subscription(&self) -> Subscription<Self::Message> {
        subscription::events().map(Message::Event)
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum Message {
    Event(iced::Event),
}
