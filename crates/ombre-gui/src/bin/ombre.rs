use std::fs::File;

use anyhow::{Context, Error};
use clap::Parser;
use iced::{Application as _, Settings};
use ombre_gui::{Application, Flags};
use tracing::metadata::LevelFilter;
use tracing_subscriber::{fmt::format::FmtSpan, EnvFilter};

fn main() -> Result<(), Error> {
    initialize_logging()?;

    let Args {} = Args::parse();

    let settings = Settings {
        flags: Flags::default(),
        ..Default::default()
    };

    Application::run(settings)?;

    Ok(())
}

#[derive(Debug, clap::Parser)]
#[clap(version, about, author)]
struct Args {}

fn initialize_logging() -> Result<(), Error> {
    // certain crates generate a lot of logs at the info level. Let's ignore
    // them by default so we don't spam the logs.
    const SPAMMERS: &[&str] = &["wgpu_hal", "iced_native", "iced_wgpu", "wgpu_core"];

    let is_interactive = atty::is(atty::Stream::Stderr);
    let filter = EnvFilter::builder()
        .with_default_directive(LevelFilter::INFO.into())
        .from_env_lossy();
    let filter = SPAMMERS.iter().fold(filter, |filter, s| {
        filter.add_directive(format!("{s}=warn").parse().unwrap())
    });

    let fmt = tracing_subscriber::fmt()
        .with_span_events(FmtSpan::CLOSE)
        .with_env_filter(filter);

    if is_interactive {
        fmt.with_writer(std::io::stderr).init();
    } else {
        let log_file = ombre_gui::log_file();
        if let Some(parent) = log_file.parent() {
            std::fs::create_dir_all(parent)
                .with_context(|| format!("Unable to create \"{}\"", parent.display()))?;
        }

        let f = File::options()
            .append(true)
            .create(true)
            .open(&log_file)
            .with_context(|| format!("Unable to open \"{}\" for writing", log_file.display()))?;
        fmt.with_writer(f).json().init();
    }

    Ok(())
}
