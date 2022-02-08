## Useful information I gleaned from CelesTrak  

[CelesTrak](https://celestrak.com/) has been an immensely useful resource as I
learn more about Astrodynamics and satellite tracking. Here's a few links from
that site worth worth noting:

*   [recent TLE data](https://celestrak.com/pub/TLE/catalog.txt) for 23,837 objects (at this time);
*   [satcat data](https://celestrak.com/pub/satcat.txt) for 51,511 objects (at this time);
*   [visualization](https://celestrak.com/cesium/orbit-viz.php?tle=/pub/TLE/catalog.txt&satcat=/pub/satcat.txt)
powered by the data listed above and [`cesiumjs`](https://cesium.com/platform/cesiumjs/),
a library provided by [Digital Arsenal](https://digitalarsenal.io/); 
*   information about [book](https://celestrak.com/software/vallado-sw.php)
*Fundamental of Astrodynamics and Applications (4th Edition)* by David A. Vallado,
including links to [buy it](https://astrobooks.com/fundamentals-of-astrodynamics-and-applications-4th-edition-vallado-2013-softcover.aspx)
and associated code/papers;
*   a list of [satellite tracking software](https://celestrak.com/software/satellite/sat-trak.php),
including some [authored by T.S. Kelso](https://celestrak.com/software/tskelso-sw.php),
the creator of Celestrak.

About their visualization: as I was writing this post, I realized it has a
view for recent conjunctions!

<p align="center"> 
  <img src="/images/celestrak-conjunction-viewer.png" title="CelesTrak Conjunction Viewer" width="" />
</p>

The table is clickable, so you can access a detailed view of particular conjunctions.

<p align="center"> 
  <img src="/images/celestrak-conjunction-viewer-detail.png" title="Detailed view for a particular conjunction" width="" />
</p>

<a id="cdm" />
I [mentioned CDMs before](/2022/01/26/conjunction-data-message.html),
and this is so far the best source of conjunctions data/visualization I've been
able to find. I'm intrigued about how it's implemented, since I don't see an
obvious source of CDMs data (like what you can easily spot for TLEs and the SATCAT,
which I linked above). I doubt these are calculated on the fly. More investigation
needed!
