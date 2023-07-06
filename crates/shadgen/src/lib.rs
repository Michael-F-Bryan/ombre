#[derive(Debug, Clone, PartialEq)]
pub struct Job {
    pub base_gain: f32,
    pub repeater_antenna_height: f32,
    pub mobile_antenna_height: f32,
    pub frequency: f32,
    pub resolution: f32,
    pub range: f32,
    pub optimistic: bool,
    pub colour: String,
}

impl Default for Job {
    fn default() -> Self {
        Job {
            base_gain: 171.0,
            repeater_antenna_height: 12.0,
            mobile_antenna_height: 2.0,
            frequency: 174.0,
            resolution: 200.0,
            range: 50.0,
            optimistic: false,
            colour: "red".to_string(),
        }
    }
}

#[derive(Debug, Copy, Clone, PartialEq)]
pub struct Location {
    pub longitude: f32,
    pub latitude: f32,
}
