## Orbit visualization with Dash

After discovering the ability to [convert a TLE to Orbit](/2022/01/19/space-api.html#to-orbit)
using `TLE-tools`, I went spelunking and learned something really helpful:
how to plot orbits in order to visualize them! This will be incredibly
helpful to me, since I'm a visual learner. This is what the orbit for the
[example TLE](/2022/01/17/two-line-element-set.html#example) I retrieved from
SpaceTrack looks like:

<p align="center"> 
  <img src="/images/tle-example-plot.png" title="Orbit visualization" />
</p>

That plot is currently available at [api.thiago.pub:9091](http://api.thiago.pub:9091).
I plan on making this a little more interesting, creating a simple UI to allow
entering a TLE and getting back the decoded version, the textual representation
for the corresponding orbit (using my [space-api](/2022/01/19/space-api.html#api)),
and a link to the visualization.

Here's what I learned by spelunking into the code. `TLE-tools` relies on
[`poliastro`](https://github.com/poliastro/poliastro) to convert a TLE to
`poliastro.twobody.orbit.Orbit`. `poliastro` is a library for interactive
Astrodynamics and Orbital Mechanics, which I'll definitely be exploring further.

`poliastro` uses [`Dash`](https://github.com/plotly/dash) to plot orbits. `Dash` 
is a framework for data applications, built on top of
[gi`plotly.js`](https://github.com/plotly/plotly.js), React and Flask.
[`plotly.py`](https://github.com/plotly/plotly.py) is an interactive,
browser-based graphing library for Python, based on `ploty.js`.

These are pretty impressive, powerful libraries that I'm glad to be aware of now!
