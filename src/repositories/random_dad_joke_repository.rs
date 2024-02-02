use reqwest::{Client, Error};

#[derive(Debug, serde::Deserialize)]
pub(crate) struct DadJokeApiResponse {
    pub(crate) joke: String,
}

pub(crate) async fn random_dad_joke() -> Result<DadJokeApiResponse, Error> {
    let url = "https://icanhazdadjoke.com".to_string();
    let client = Client::new();

    let response = client.get(url).header("Accept", "application/json").send().await?;

    let response_body:DadJokeApiResponse = response.json().await?;

    Ok(response_body)
}