FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y build-essential \
curl \
pkg-config \
libssl-dev

RUN apt update
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup default nightly
RUN USER=root cargo new --bin basic-api
WORKDIR "/basic-api"
COPY . .
RUN cargo build --release
RUN rm src/*.rs

FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
ENV ROCKET_ADDRESS=0.0.0.0
EXPOSE 8000
COPY --from=0 /basic-api/target/release/basic-api /usr/local/bin/basic-api
WORKDIR /usr/local/bin
CMD ["basic-api"]