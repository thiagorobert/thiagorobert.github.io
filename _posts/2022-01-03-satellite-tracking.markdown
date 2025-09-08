---
layout: post
title: "LeoLabs, CelesTrak, SpaceTrack, and AstriaGraph"
date: 2022-01-03 12:00:00 -0000
---

## LeoLabs, CelesTrak, SpaceTrack, and AstriaGraph

As I mentioned before, I was immediately hooked once I saw LeoLabs'
visualization of objects in Low Earth Orbit (e.g., SpaceX's
[Starlink](https://platform.leolabs.space/visualizations/leo#search=starlink;view=lastTracked) constellation,
the [ISS](https://platform.leolabs.space/visualizations/leo#search=zarya;view=lastTracked),
[rocket bodies](https://platform.leolabs.space/visualizations/leo#search=r%2Fb;view=lastTracked),
and [debris](https://platform.leolabs.space/visualizations/leo#search=deb;view=lastTracked)).
I proceeded to research everything I could find about LeoLabs and other
entities focused on satellite tracking.

<a id="stellarium" />
One of the first things I tried out was [Stellarium](https://stellarium.org/), an
Open Source planetarium software I've been playing around with for a while now.
Their [satellite plugin](https://github.com/Stellarium/stellarium/tree/master/plugins/Satellites)
is a really good resource, I've been studying that code in the last few weeks.

<p align="center"> 
  <img src="/images/stellarium-screenshot.png" title="Stellarium satellite visualization" width="420px" />
</p>

The satellite data used by Stellarium's satellite plugin is from [CelesTrak](http://celestrak.com),
the OG of satellite tracking, led by [T.S. Kelso](https://twitter.com/TSKelso).
The site has been up and running as CelesTrack [since March 1998](https://celestrak.com/brief-history.php)
and provides current and historical "two-line element set" ([TLE](https://celestrak.com/NORAD/elements/))
data for most satellites in the Satellite Catalog ([SATCAT](https://celestrak.com/satcat/search.php)).
It also provides a really cool [visualization](https://celestrak.com/cesium/orbit-viz.php?tle=/pub/TLE/catalog.txt&satcat=/pub/satcat.txt)
and a [proxy](https://celestrak.com/SpaceTrack/) that lets users query SpaceTrack data.

[SpaceTrack](https://space-track.org/) is a service maintained by the
United States Space Force. Its stated goal is to provide critical Space Situational
Awareness (SSA) data for the worldwide Space Community. Anyone can create a
SpaceTrack account and get access to their data via a REST API. Once you get
access to the data, try out their [Query Builder](https://www.space-track.org/#queryBuilder)
to explore the API and data.

<a id="astriagraph" />
[AstriaGraph](http://sites.utexas.edu/moriba/astriagraph/) is a research project
led by [Moriba Jah](https://twitter.com/moribajah), a fellow dreadhead. They aim
to aggregate all sources of Space Domain data (including unstructured data like
Twitter posts) into an "ontology-based knowledge graph" to improve SSA.
Their [visualization](http://astria.tacc.utexas.edu/AstriaGraph/) is really
impressive and displays data from the following sources:

1.   [DigitalGlobe](https://www.digitalglobe.com)
1.   [JSC Vimpel](http://spacedata.vimpel.ru)
1.   [LeoLabs](https://www.leolabs.space)
1.   [Planet](https://www.planet.com)
1.   [SeeSat-L](http://www.satobs.org/seesat/seesatindex.html) (see also <https://www.prismnet.com/~mmccants/tles>)
1.   [Union of Concerned Scientists](https://www.ucsusa.org/nuclear-weapons/space-weapons/satellite-database)
1.   [SpaceTrack](https://www.space-track.org)

LeoLabs is a private company (Series B startup with less than 90 employees at this time)
that created a global [Phased-Array Radar](https://www.leolabs.space/radars/)
network capable of tracking the ~18,000 objects in Low Earth Orbit that are 
10cm or bigger. These include the ISS, active and defunct satellites, and debris like
spent rocket bodies and shrapnel created by Anti-Satellite Tests ([ASAT](https://www.armscontrol.org/act/2021-12/news/russian-asat-test-creates-massive-debris)).
LeoLabs provides customers with an API that can be used to access their data,
and services like [Collision Avoidance](https://www.leolabs.space/collision-avoidance/),
which satellite operators can use to maneuver their fleet out of harm's way.
LeoLab's newer radars are sensitive enough to identify LEO objects as small as 2cm.
Data collected by their radars is available via their API in roughly 6 minutes
([metrics](https://platform.leolabs.space/system_metrics)).

It's been very fun researching these topics, and I hope this summary is helpful to others!
