FROM rust:alpine3.17 AS base

FROM base AS dependancies

RUN apk update && apk add --no-cache \
  build-base \
  musl \
  perl \
  gcc


RUN cargo install mdbook

FROM alpine

COPY --from=dependancies /usr/local/cargo/bin/mdbook /usr/bin/

RUN adduser -D deploy
USER deploy
COPY --chown=deploy ./book/ /home/deploy/book/
WORKDIR /home/deploy/book/
