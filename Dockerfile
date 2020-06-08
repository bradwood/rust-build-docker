FROM rust:1.43-stretch as builder
RUN apt-get update && \
    apt-get install -y \
        binutils-dev \
        build-essential \
        cmake \
        git \
        libcurl4-openssl-dev \
        libdw-dev \
        libiberty-dev \
        ninja-build \
        python3 \
        zlib1g-dev \
        ;

WORKDIR /root
ENV KCOV=https://github.com/SimonKagstrom/kcov/archive/v38.tar.gz
RUN wget -q $KCOV -O - | tar xz -C ./ --strip-components 1
RUN mkdir build && cd build \
 && cmake -G Ninja .. \
 && cmake --build . --target install



FROM rust:1.43-stretch
RUN apt-get update && \
    apt-get install -y \
    binutils \
    libcurl4-openssl-dev \
    zlib1g \
    libdw1 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/bin/kcov* /usr/local/bin/
COPY --from=builder /usr/local/share/doc/kcov /usr/local/share/doc/kcov

ENV PATH=/root/.cargo/bin:"$PATH"
RUN rustup update \
    && rustup component add clippy \
    && cargo install \
      cargo-kcov \
      cargo-readme \
      cargo-tree \
      cargo-outdated \
      cargo-tarpaulin \
      graphql_client_cli \
      just \
      ;
