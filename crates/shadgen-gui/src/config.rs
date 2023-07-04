use anyhow::{Context, Error};
use directories::ProjectDirs;
use once_cell::sync::Lazy;
use std::path::{Path, PathBuf};

pub static DIRECTORIES: Lazy<ProjectDirs> =
    Lazy::new(|| ProjectDirs::from("com", "michaelfbryan", "shadgen").unwrap());

pub fn log_file() -> PathBuf {
    DIRECTORIES.data_local_dir().join("shadgen.log")
}

#[derive(Debug, Default, Clone, PartialEq, serde::Serialize, serde::Deserialize)]
pub struct Config {}

impl Config {
    pub fn load(config_file: impl AsRef<Path>) -> Result<Self, Error> {
        let path = config_file.as_ref();

        match std::fs::read_to_string(path) {
            Ok(cfg) => toml::from_str(&cfg).context("Unable to deserialize the config"),
            Err(e) if e.kind() == std::io::ErrorKind::NotFound => {
                tracing::info!("No config file found. Falling back to the default.");
                Ok(Config::default())
            }
            Err(other) => {
                Err(Error::new(other).context(format!("Unable to read \"{}\"", path.display())))
            }
        }
    }
}
