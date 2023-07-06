use anyhow::{Context, Error};
use camino::Utf8PathBuf;
use directories::ProjectDirs;
use once_cell::sync::Lazy;
use std::path::{Path, PathBuf};

pub static DIRECTORIES: Lazy<ProjectDirs> =
    Lazy::new(|| ProjectDirs::from("com", "michaelfbryan", "ombre").unwrap());

pub fn log_file() -> PathBuf {
    DIRECTORIES.data_local_dir().join("ombre.log")
}

#[derive(Debug, Default, Clone, PartialEq, serde::Serialize, serde::Deserialize)]
pub struct Config {
    pub radio_mobile_exe: Utf8PathBuf,
    pub srtm_path: Utf8PathBuf,
}

impl Config {
    pub fn filename() -> PathBuf {
        DIRECTORIES.config_dir().join("ombre.toml")
    }

    pub fn load(config_file: impl AsRef<Path>) -> Result<Self, Error> {
        let path = config_file.as_ref();

        match std::fs::read_to_string(path) {
            Ok(cfg) => toml::from_str(&cfg).context("Unable to deserialize the config"),
            Err(e) if e.kind() == std::io::ErrorKind::NotFound => {
                tracing::debug!("No config file found. Falling back to the default.");
                Ok(Config::default())
            }
            Err(other) => {
                Err(Error::new(other).context(format!("Unable to read \"{}\"", path.display())))
            }
        }
    }

    pub fn save(&self, config_file: impl AsRef<Path>) -> Result<(), Error> {
        let config_file = config_file.as_ref();

        if let Some(parent) = config_file.parent() {
            std::fs::create_dir_all(parent)
                .with_context(|| format!("Unable to create \"{}\"", parent.display()))?;
        }

        let toml = toml::to_string(self).context("Unable to serialize to TOML")?;

        std::fs::write(config_file, toml)
            .with_context(|| format!("Unable to write to \"{}\"", config_file.display()))?;

        Ok(())
    }
}
