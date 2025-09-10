---
layout: post
title: "Configure Subdomain"
date: 2022-01-10 12:00:00 -0000
---

## Making the REST interface available at `api.thiago.pub`

Onwards!
 
We previously covered an
[example gRPC service and REST interface](/2022/01/04/grpc-example.html) and
[how to deploy it using Fargate](/2022/01/06/fargate.html).

I just set up a new record for domain `thiago.pub` to make the REST interface
accessible via `api.thiago.pub`:

```
> curl -X POST \
    api.thiago.pub/v1/response -d '{"message": "greetings"}'

{"message":"Hello I am up and running received \"greetings\" message from you","received":true}
```

This is accomplished by creating a new Simple Routing record for the Hosted Zone
associated with the domain, linking subdomain `api` with the Internet-facing
Application Load Balancer created [previously](/2022/01/06/fargate.html#load-balancer). 

<p align="center"> 
  <img src="/images/api_thiago_pub-hz-record.png" title="Create a new record for the domain" width="" />
</p>

For the record ([ba dum tss](https://www.youtube.com/watch?v=6zXDo4dL7SU)), here's the full set of records associated with domain `thiago.pub`:

<p align="center"> 
  <img src="/images/api_thiago_pub-hz-overview.png" title="All records associated with the domain" width="" />
</p>
