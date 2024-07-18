default:
    just --list

build:
    trunk build --release

dev:
    cargo watch -w src -s 'trunk serve'
