# Use a Rust base image
FROM rust:latest as builder

# Set the working directory
WORKDIR /usr/src/my_app

# Copy the Cargo.toml and Cargo.lock files to optimize dependency caching
COPY Cargo.toml Cargo.lock ./

# Build the dependencies
RUN mkdir src && echo "fn main() {}" > src/main.rs && \
    cargo build --release

# Copy the application source code
COPY . .

# Build the application
RUN cargo build --release

# Create a minimal runtime image
FROM debian:buster-slim

# Set the working directory
WORKDIR /usr/local/bin

# Copy the built binary from the builder stage to the runtime image
COPY --from=builder /usr/src/my_app/target/release/basic-rust-api .

# Set the binary as the entry point
ENTRYPOINT ["./basic-rust-api"]