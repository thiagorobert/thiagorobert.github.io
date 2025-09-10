---
layout: post
title: "Fun With Certificates"
date: 2022-01-13 12:00:00 -0000
---

## Running gRPC server and REST proxy with TLS

I just updated our gRPC example code to support TLS. Commit
[`40b1a5f`](https://github.com/thiagorobert/grpc-example/commit/40b1a5fa3075436ecd5b94110d8ed92d59700ae6)
adds the required TLS data (certificate, private key) and updates both the
Python gRPC server and the Go REST proxy to optionally support secure channels.

This is how to start the gRPC server and REST proxy with TLS enabled:

###### gRPC server
```
python src/python_grpc/server.py \
    --cert_path tls_data/server.crt \
    --private_key_path tls_data/server.key
```

###### REST proxy
```
./rest_reverse_proxy --cert_path tls_data/server.crt
```

And to test it, you can use the example client or `grpcurl` with TLS enabled:

######  gRPC client
```
python src/python_grpc/client.py --cert_path tls_data/server.crt
```

######  `grpcurl`
```
grpcurl \
    -cacert tls_data/server.crt \
    -d '{"message": "greetings grpcurl"}' \
    localhost:8080  \
    grpc_example_proto.Unary/GetServerResponse
```

Here are two helpful docs I used while implementing this feature:
*    <https://www.sandtable.com/using-ssl-with-grpc-in-python/>
*    <https://grpc.io/docs/guides/auth/>

Next up: exposing the gRPC service via `api.thiago.pub:8080`!
