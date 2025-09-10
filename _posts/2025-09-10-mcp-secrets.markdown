---
layout: post
title: "MCP secrets"
date: 2025-09-10
categories: blog
---

## A clever way to pass in secrets to MCPs

I've been on a quest to learn everything about MCPs and OAuth, especially Dynamic Client Registration. The journey and details there are worth a post of their own, which I'll write in the future (a quick tease, check out this repository with my research so far: [https://github.com/thiagorobert/FastMCPv2-example](https://github.com/thiagorobert/FastMCPv2-example))

Right now I really just want to point out [`superargs`](https://github.com/supercorp-ai/superargs). It solves a problem I've been grappling with since I embarked on this journey. The MCP I wrote is a proxy to Github's API, and it requires a secret (auth token or Personal Access Token) to access Github data. I ended up creating an [OAuth App](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/creating-an-oauth-app) in my Github account, and wrote [some code](https://github.com/thiagorobert/mcp-oauth-example/tree/8c5f4e9d24fadb7b859635d40fff8b01c46fd2f6) to perform OAuth using that app and save the token to a file, which I can then feed to my MCP using `.env` or environment variables.

But that's incredibly lame, right? I want my MCP to work for everyone. Ideally, I would like to host it somewhere (Fargate?) and would like folks to be able to use it to access their own repositories, using their own secrets as needed. I spent *A LOT* of time trying to figure out a way to do that. Today I attempted to implement OAuth Token Exchange ([`rfc8693`](https://datatracker.ietf.org/doc/html/rfc8693)) to solve that problem without success (I believe Github simply doesn't support it). I also learned that Github Enterprise lets you create enterprise-level Personal Access Tokens and OAuth Apps, which would allow my MCP to retrieve data for all repositories within that enterprise.

I was pretty much resigned to just live with this limitation, when I found [https://supermachine.ai/](https://supermachine.ai/), a service that lets you quickly deploy your own MCPs (note to self, I also want to explore [https://gofastmcp.com/deployment/fastmcp-cloud](https://gofastmcp.com/deployment/fastmcp-cloud)). I started looking into the [code by Supercorp](https://github.com/supercorp-ai), the entity behind that service, when I found [`superargs`](https://github.com/supercorp-ai/superargs).

In a nutshell, `superargs` wraps your MCP around a different MCP which provides a new tool 'Update args'. So, during a conversation with an LLM, you can just say "list available repositories using githubToken <your token here>". The LLM knows to call that tool to update the argument for the wrapped MCP, and use that functional MCP to list repositories you have access to given your credentials. If this sounds confusing, it's because it is. I wouldn't be able to make sense of this if I had not spent quite a few hours mulling this problem.

Here's my Claude Desktop (which I'm [running on Linux](https://github.com/aaddrick/claude-desktop-debian)) demonstrating the use of `superargs` and another of their tools, [`supergateway`](https://github.com/supercorp-ai/supergateway):

```
{
  "mcpServers": {
    "supermachineHost": {
      "command": "npx",
      "args": [
        "-y",
        "supergateway",
        "--sse",
        "https://mcp-server-728d3008-180f-4c91-9c28-74624ae7f1b5.supermachine.app"
      ]
    },
    "mygithub": {
      "command": "npx",
      "args": [
        "-y",
        "superargs",
        "--stdio",
        "GITHUB_ACCESS_TOKEN={{githubToken}} uv --directory /workspace/github/FastMCPv2-example run mcp_server.py"
      ]
    }
  }
}
```

`supergateway` is pretty cool too - it also solves a problem I've dealt with during my MCP exploration journey. But the details are probably fodder for a future post. Both of these tools feel a bit hacky at first glance, but all of this tech is so bleeding edge that you have to think outside of the box to get things working - I like that mindset. Also, folks at Supercorp are literally building a business backed by that code, so props to them!