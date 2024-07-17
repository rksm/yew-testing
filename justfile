default:
    just --list

build:
    trunk build --release

dev:
    trunk serve
