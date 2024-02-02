use rocket::serde::{Deserialize, Serialize};
use rocket_okapi::JsonSchema;

#[derive(Responder, Debug, Deserialize, Serialize, JsonSchema)]
pub struct Health {
    pub status: String,
}

#[derive(Responder, Debug, Deserialize, Serialize, JsonSchema)]
pub struct NasaResponse {
    pub image_url: String,
}

#[derive(Responder, Debug, Deserialize, Serialize, JsonSchema)]
pub struct DadJokeResponse {
    pub joke: String,
}