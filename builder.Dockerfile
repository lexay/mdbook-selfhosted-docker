FROM rust:alpine3.17 AS base

FROM base AS dependencies
RUN apk update && apk add --no-cache build-base
RUN cargo install mdbook

FROM alpine
COPY --from=dependencies /usr/local/cargo/bin/mdbook /usr/bin/
