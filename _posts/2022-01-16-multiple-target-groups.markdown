## Associating multiple target groups with your Fargate service

One small problem with the [Fargate configuration](/2022/01/06/fargate.html)
created for our gRPC/REST example code is the fact I had to manage the
[gRPC Target Group](/2022/01/15/expose-grpc.html#target-group) manually. I.e., every time I
had to update the service (to deploy a new image, for example), my container
would be re-deployed to a new instance with a new IP address. The
[REST Target Group](/2022/01/06/fargate.html#target-group) would be updated
automatically by the system, but since my service wasn't aware of the gRPC Target
Group, I had to manually register the new IP address there.

I though to myself: "there must be a better way to do this". I poked around the
ECS Console UI, thinking I probably missed the option to register multiple Target
Groups with my service, without luck. Howerver, a simple Google search pointed me
to [this gem](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/register-multiple-targetgroups.html).

So, you can do it, but you have to use the CLI. Which is great for me: I
usually prefer the command line and was looking for an excuse to learn how to
manage my service using `aws` CLI. FWIW, I'm using `aws-cli/1.15.58`.

It was suprisingly easy! I got it working in 20 minute flat. I knew I would have
to create a new service, since you can't update a Fargate service Load
Balancer-related configurations after service creation. So my approach was
basically dumping the existing service (created via the Console UI), modifying
the `loadBalancers` config entry, and creating a new service
based out of that.

###### Dump the existing service

```
aws ecs describe-services --services <service name> --cluster <cluster name>
```

###### Dump all Target Groups to retrieve IDs

```
aws elbv2 describe-target-groups
```

###### Generate a skeleton json file for your new service

```
aws ecs create-service --generate-cli-skeleton > my-service-config.json
```

###### Create new service

```
aws ecs create-service --cli-input-json file://my-service-config.json
```

After generating the skeleton json file, I populated it with the relevant entries
from the json dump of the existing service. I then updated `loadBalancers` entry
and picked a new cool name.

When attempting service creation, I had to fix all of the little problems in my
json config file, but the CLI output made that pretty easy.

The one error that took a bit more investigating was `You cannot specify an IAM
role for services that require a service linked role.` Luckily, as it's usually
the case when working with AWS, there was a [good stackoverflow thread](https://stackoverflow.com/questions/50536577/ecs-cli-you-cannot-specify-an-iam-role-for-services-that-require-a-service-lin)
and [doc](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using-service-linked-roles.html)
to help me out. The solution was to simply omit the `"role"` entry in the json
config, to let the system use the "service-linked" role. 

My next step now will be deleting the old service, since I won't need that any
longer. Overall this was a lot smoother than I had antecipated.
