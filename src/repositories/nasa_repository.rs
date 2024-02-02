use std::env;
use reqwest::{Error};

#[derive(Debug, serde::Deserialize)]
pub(crate) struct NasaAPIResponse {
    pub(crate) url: String,
}
pub(crate) async fn nasa_repository() -> Result<NasaAPIResponse, Error> {
    let api_key = match env::var("nasa-api-key") {
        Ok(key) => key,
        Err(_) => panic!("NASA API key not found in environment"),
    };

    let url = format!("https://api.nasa.gov/planetary/apod?api_key={}", api_key);

    let response_body: NasaAPIResponse = reqwest::get(url).await?.json().await?;

    Ok(response_body)
}