FROM alpine:edge as builder
RUN apk update && apk add --no-cache build-base cmake ninja python3 \
      binutils-dev curl-dev elfutils-dev
WORKDIR /root
ENV KCOV=https://github.com/SimonKagstrom/kcov/archive/v38.tar.gz
RUN wget -q $KCOV -O - | tar xz -C ./ --strip-components 1
RUN mkdir build && cd build \
 && CXXFLAGS="-D__ptrace_request=int" cmake -G Ninja .. \
 && cmake --build . --target install

FROM alpine:edge
COPY --from=builder /usr/local/bin/kcov* /usr/local/bin/
COPY --from=builder /usr/local/share/doc/kcov /usr/local/share/doc/kcov
RUN apk add --no-cache \
    bash \
    python \
    python3 \
    binutils-dev \
    curl-dev \
    elfutils-libelf \
    gcc \
    musl-dev \
    rustup
ENV PATH=/root/.cargo/bin:"$PATH"
RUN rustup-init --verbose -y --default-toolchain stable --default-host x86_64-unknown-linux-musl \
    && rustup update \
    && rustup component add clippy \
    && cargo install \
      cargo-kcov
      # cargo-readme \
      # cargo-tree \
      # cargo-outdated \
