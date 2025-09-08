---
layout: post
title: "Input TLE, retrieve Orbit"
date: 2022-01-21 12:00:00 -0000
---

## Input TLE, retrieve Orbit

A basic version of the UI I [had in mind](/2022/01/20/visualizing-orbits.html#ui)
is now available at [api.thiago.pub:8080](http://api.thiago.pub:8080)! For now,
it simply lets the user enter a TLE and retrieve the string Orbit. This is what
it looks like:


<p align="center"> 
  <img src="/images/ui-screenshot.png" title="Basic version of the UI" />
</p>

It's a simple Node app I created from scratch, which was a lot of fun to do.
The two areas that gave me the most trouble: CSS and figuring out the proper
encoding for the form content.

I initially issued a `POST` request from the form without worrying about encoding,
but quickly realized the content would be URL-encoded. And that was hard to decode
properly for various reasons. I got pretty close to a somewhat reasonable solution,
but not to the finish line.

At that point, I took a step back and thought to myself: there must be a way to
avoid URL-encoding the contents in the first place. That's when I learned about
the `multipart/form-data` encoding ([doc](https://www.w3.org/TR/html401/interact/forms.html#h-17.13.4)),
which is often used when inputting files. That helped me solve my problem,
even if I wish I had landed on a more elegant implementation. At least I got to
add a variable called [`bodyParts`](https://github.com/thiagorobert/space-api/blob/4488a410d1a12d920ee9ca65d28a10002a96700c/src/ui/app.js#L78)
to my code. :P
