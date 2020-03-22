# rust-build-docker

This builds a Rust project Docker container designed for use in Gitlab CI for
Rust projects.

## Contents

It is derived from `alpine:edge` and includes:
 - `rustup`
 - `cargo`
 - `rustfmt`
 - `clippy`
 - `cargo-kcov` (and the underlying `kcov` binary)
 > - `cargo-readme`
 > - `cargo-tree`
 > - `cargo-outdated`

`rustup` is invoked to select the `stable` Rust release.

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

## Credits

 - [ko1nksm/kcov-alpine-docker](https://github.com/ko1nksm/kcov-alpine-docker)
   where I nicked most of the `kcov` stuff.

