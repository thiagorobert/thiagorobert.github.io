---
layout: post
title: "Health Checking"
date: 2022-01-14 12:00:00 -0000
---

## Enabling gRPC health checking

TIL about [gRPC Health Checking Protocol](https://github.com/grpc/grpc/blob/master/doc/health-checking.md),
and implemented it in our gRPC example code (see
[`07f0d9e`](https://github.com/thiagorobert/grpc-example/commit/07f0d9e6723a6262085b4276dcb763026407ae1b)).

The infrastructure is pretty evolved. The health checking interface is simply a
gRPC service you configure and export. The auto-generated proto code is
distributed (ie, you don't have to generate it yourself). For Python, you can
get it via pip `grpcio-health-checking` (see [docs](https://grpc.github.io/grpc/python/grpc_health_checking.html)).

In the example code, I ended up exposing a new insecure port `9090` to enable
clients to perform health checks using plain-text HTTP/2 (ie, without TLS). The
gRPC ecosystem provides utility [`grpc-health-probe`](https://github.com/grpc-ecosystem/grpc-health-probe),
basically a client for gRPC health checking. But since the protocol is simply
implemented via a gRPC service, you can also perform health checks using `grpcurl`
or a custom client. See examples below.

###### Health checking using `grpc-health-probe`

```
> grpc-health-probe \
    -addr=localhost:9090 \
    -connect-timeout 250ms \
    -rpc-timeout 100ms

status: SERVING
```

###### Health checking using `grpcurl`

```
> grpcurl \
    --plaintext \
    -d '{"service": "grpc.health.v1.Health"}' \
    localhost:9090 \
    grpc.health.v1.Health.Check

{
  "status": "SERVING"
}
```
