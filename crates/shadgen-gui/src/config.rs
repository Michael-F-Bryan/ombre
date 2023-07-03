use directories::ProjectDirs;
use once_cell::sync::Lazy;
use std::path::PathBuf;

pub static DIRECTORIES: Lazy<ProjectDirs> =
    Lazy::new(|| ProjectDirs::from("com", "michaelfbryan", env!("CARGO_PKG_NAME")).unwrap());

pub fn log_file() -> PathBuf {
    DIRECTORIES.data_local_dir().join("shadgen.log")
}
