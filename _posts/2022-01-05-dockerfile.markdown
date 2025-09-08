---
layout: post
title: "Dockerfile for gRPC/REST server"
date: 2022-01-05 12:00:00 -0000
---

## Dockerfile for gRPC/REST server

I created a Dockerfile for [yesterday's](/2022/01/04/grpc-example.html)
gRPC/REST server. The Dockerfile and a few helper scripts to build/run the image
are now available at <https://github.com/thiagorobert/grpc-example>.

It uses `ubuntu:20.04` as the base image. I'll probably upgrade to something
more recent in the future ([list of available Ubuntu images](https://hub.docker.com/_/ubuntu)).
The contents of the Dockerfile are embedded below, and here's a breakdown
of what it does:

*   Lines 3-26: install the required dependencies, including `go1.17.5`.
*   Lines 28-35: set up `$GOBIN` and the root directory for `grpc-example` code. 
*   Lines 37-42: copy `grpc-example` code.
*   Lines 44-52: install `protoc-gen-go` ([docs](https://github.com/grpc-ecosystem/grpc-gateway/));
binaries will be available in `$GOBIN`.
*   Lines 54-84: generate proto code, set up required Go modules, and build Go
code ([docs](https://github.com/thiagorobert/grpc-example#manually)).
*   Lines 86-92: expose required ports; AFAIK, this is simply documentation (not strictly required).
*   Lines 94-96: copy and run [script](https://github.com/thiagorobert/grpc-example/blob/main/bootstrap.sh)
that starts gRPC server and REST proxy.

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2Fthiagorobert%2Fgrpc-example%2Fblob%2Fmain%2FDockerfile&style=github&showLineNumbers=on"></script>

It's probably worth taking a look at scripts to
[build](https://github.com/thiagorobert/grpc-example/blob/main/docker-build.sh)
and [run](https://github.com/thiagorobert/grpc-example/blob/main/docker-run.sh)
the Docker image. Specifically, note that you should publish required
container's ports to the host when running ([docs](https://docs.docker.com/engine/reference/commandline/run/)).
These are `8080` for the gRPC interface, and `8081` for the REST interface.
