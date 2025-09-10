---
layout: post
title: "Satellite Tracking Sites"
date: 2022-02-10 12:00:00 -0000
---

## Sites that provide satellite tracking and related features

I just found a number of good sites that provide functionality similar to what I
had envisioned for [`api.thiago.pub:8080`](http://api.thiago.pub:8080):

*    [Orbital Predictor](http://www.orbitalpredictor.com/home/): This is interesting
since the author seems to have similar goals as mine; he even created a [blog](https://irishspacehacker.blogspot.com/)!
It relies on [`cesiumjs`](https://cesium.com/platform/cesiumjs/) and let's you visualize orbits and corridors (footprint), add satellites,
and get overpasses for a location specified via lat/lon or by clicking on the 3d
globe. It seems a few features require creating an account which I didn't attempt.

*    [N2YO](https://www.n2yo.com/): A site created by [Southern Stars](http://southernstars.com),
the folks behind mobile app [Orbitrack](https://play.google.com/store/apps/details?id=com.southernstars.orbitrack)
and crowd-funded nano-satellite [SkyCube](https://www.kickstarter.com/projects/880837561/skycube-the-first-satellite-launched-by-you/posts).
The site is a mash of features and links to space-related articles.

*    [SatNOGS DB](https://db.satnogs.org/): A database of satellites and transmitters,
with photos and other information for each (example: [ISS](https://db.satnogs.org/satellite/XSKZ-5603-1870-9019-3066)).
It seems the data is crowd-sourced. They also have a Grafana-based [dashboard](https://dashboard.satnogs.org/d/QjDe5S8mk/satellite-telemetries)
which I'm not quite sure how to use or interpret.

*    [STL Tracker](https://stltracker.github.io/): A beautiful site, very easy to
use. Served via Github Pages (just like this blog). It would be really interesting
to see the source code, but the Github repo simply contains what looks like
automatically generated Javascript, HTML, and CSS, in addition to assets and versioned
`.msi` files. Digging a little deeper, I found [this website](https://www.stltracker.com/home)
with more information about the Windows application by [Sumus](http://www.sumusltd.com/)
which powers this site.
