#[macro_use] extern crate rocket;

use rocket_okapi::openapi_get_routes;
use rocket_okapi::swagger_ui::{make_swagger_ui, SwaggerUIConfig};

mod models {
    pub mod responses;
}

mod repositories {
    pub mod nasa_repository;
    pub mod random_dad_joke_repository;
}

mod routes {
    pub mod routes;
}

#[launch]
fn rocket() -> _ {
    rocket::build()
        .mount(
            "/",
            openapi_get_routes![
                routes::routes::health,
                routes::routes::nasa_potd,
                routes::routes::random_dad_joke
            ],
        )
        .mount(
            "/api-docs",
            make_swagger_ui(&SwaggerUIConfig {
                url: "../openapi.json".to_owned(),
                ..Default::default()
            }),
        )
}