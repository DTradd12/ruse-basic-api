#!/bin/bash

# Build Rust project
cargo build --release

# Build Docker image
docker build -t basic_rust_api_image .

# Stop and remove the existing Docker container if it exists
docker stop basic_rust_api_container || true
docker rm basic_rust_api_container || true

# Run Docker container
docker run -d --name basic_rust_api_container -p 8000:8000 basic_rust_api_image
