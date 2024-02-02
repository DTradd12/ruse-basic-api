use rocket::serde::json::Json;
use rocket_okapi::openapi;
use crate::repositories;
use crate::models::responses::{DadJokeResponse, Health, NasaResponse};

#[openapi(tag = "Health Check")]
#[get("/health")]
pub fn health() -> Json<Health> {
    Json(Health {
        status: "UP".parse().unwrap(),
    })
}

#[openapi(tag = "NASA Picture of the Day")]
#[get("/NASA")]
pub async fn nasa_potd() -> Json<NasaResponse> {
    let response = repositories::nasa_repository::nasa_repository().await;

    Json(NasaResponse {
        image_url: response.unwrap().url,
    })
}

#[openapi(tag = "Random Dad Joke")]
#[get("/dadJoke/random")]
pub async fn random_dad_joke() -> Json<DadJokeResponse> {
    let response = repositories::random_dad_joke_repository::random_dad_joke().await;

    Json(DadJokeResponse {
        joke: response.unwrap().joke,
    })
}