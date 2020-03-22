# rust-build-docker

This builds a Rust project Docker container designed for use in Gitlab CI for
Rust projects.

## Contents

It is derived from the official rust image and includes:
 - `rustup`
 - `cargo`
 - `rustfmt`
 - `clippy`
 - `cargo-kcov` (and the underlying `kcov` binary)
 - `cargo-readme`
 - `cargo-tree`
 - `cargo-outdated`

## Usage

To just grab a local copy:

```bash
docker pull bradqwood/rust-build-docker:latest

```

In a `gitlab-ci.yml` file just set your `image` like so:

```yaml
image: bradqwood/rus-build-docker:latest
...
```

## TODO

 - Reduce image size (I've looked at alpine but a number of the build tools
   won't compile against musl c lib)

## Credits

 - [ko1nksm/kcov-alpine-docker](https://github.com/ko1nksm/kcov-alpine-docker)
   for inspiration / code for the `kcov` stuff.
