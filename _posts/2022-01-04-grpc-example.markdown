## gRPC and REST

As I way to brush up on modern Web API technologies, I took a stab at
setting up a Python gRPC server with a Go proxy providing a REST API. These
are technologies I looked into and used before, but nothing like starting
from scratch to really learn the details.

I just checked in my initial implementation at <https://github.com/thiagorobert/grpc-example>.
Take a look at the README for instructions on how to use the code. It's interesting
that most of it is actually automatically generated from the
[Protocol Buffer](https://developers.google.com/protocol-buffers/) definition.
 
Frankly, there's a lot of docs on this out there, but if it wasn't for my previous
experience at Google (where *everything* is implemented using Protocol Buffers),
this would have been a lot harder to get working.

Next steps (and foreshadowing of future posts):

1.    Create a [Dockerfile](https://docs.docker.com/engine/reference/builder/)
to package dependencies, code generation, service startup.
1.    Deploy it via AWS Fargate and make the service (both gRPC and REST
interfaces) available at [thiago.pub](http://thiago.pub).
1.    Change the code so it provides useful (or at least interesting)
Space-related functionality.

1 and 2 above are things I've done before, and 3 will help me learn more about
different Space-related libraries available out there (e.g., [Astropy](https://www.astropy.org/)).
