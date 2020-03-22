FROM alpine:3.9.5
RUN apk add --no-cache gcc musl-dev \
    && apk add --no-cache rust cargo \
    && cargo install cargo-readme cargo-clippy rustfmt
