---
layout: post
title: "Expose gRPC"
date: 2022-01-15 12:00:00 -0000
---

## Expose the gRPC service at `api.thiago.pub:8080`

Finally, we are now able to access the gRPC service in our example code via
`api.thiago.pub:8080`!

```
> grpcurl \
    -d '{"message": "greetings grpcurl"}' \
    api.thiago.pub:8080 \
    grpc_example_proto.Unary/GetServerResponse

{
  "message": "Hello I am up and running received \"greetings grpcurl\" message from you",
  "received": true
}
```

In order to enable that, I had to create an HTTPS listener for the Application
Load Balancer, which required creating a new ACM certificate for the subdomain.

<p align="center"> 
  <img src="/images/api_thiago_pub-certificate.png" title="" width="" />
</p>

AWS makes it easy to validate the certificate using DNS, as long as your domain
is managed via Route 53.

<p align="center"> 
  <img src="/images/api_thiago_pub-certificate-validation.png" title="" width="" />
</p>

<a id="target-group" />
After that is done, you'll need a new Target Group using Protocol Version gRPC.
Note that, [again](/2022/01/06/fargate.html#target-group), I hacked the Target
Group health checking, configuring it to accept any gRPC
[status codes](https://grpc.github.io/grpc/core/md_doc_statuscodes.html)
(including 12 for `UNIMPLEMENTED`). I should really configure this properly since
our example code now supports [gRPC Health Checks](/2022/01/14/health-checking.html),
but I'll leave that for some other day.

<p align="center"> 
  <img src="/images/api_thiago_pub-grpc-tg.png" title="" width="" />
</p>

After that, connect the Application Load Balancer to the Target Group...

<p align="center"> 
  <img src="/images/api_thiago_pub-lb-grpc.png" title="" width="" />
</p>

and configure the Certificate.

<p align="center"> 
  <img src="/images/api_thiago_pub-lb-grpc-certificate.png" title="" width="" />
</p>

*Voilà!* To be honest, this was a bit more difficult than you might imagine by
reading the explanation above. I definitely hit some snags along the way, but I
feel like I learned a TON getting it to work.
[This](https://aws.amazon.com/blogs/aws/new-application-load-balancer-support-for-end-to-end-http-2-and-grpc/)
was a really helpful doc I consulted - thank you to the author!

Next up: forking the gRPC example code into a new repository that I'll use to
implement a useful (or at least interesting) Space-related set of APIs!
