## Learning more about TLEs

We [previously](/2022/01/03/stellite-tracking.html) talked about Satellite Tracking
and mentioned Two-Line Element (TLE) sets.

At this point, my understanding of TLE is that it's an old-fashioned data format
created in the 70s, which the Space Industry is stuck with. From
[Wikipedia](https://en.wikipedia.org/wiki/Two-line_element_set): *"The TLE format is a de facto standard for distribution of an Earth-orbiting object's orbital elements".*

SpaceTrack provides an API that lets you query the TLE of most non-classified
space objects. It even provides an easy-to-use Query Builder tool!

<img src="/images/spacetrack-querybuilder.png" />
 
I just used SpaceTrack's Query Builder to craft
[this query](https://www.space-track.org/basicspacedata/query/class/tle/NORAD_CAT_ID/25544/orderby/NORAD_CAT_ID%20asc/limit/1/emptyresult/show).
The json response contains the TLE of the ISS (fun fact: [Zarya](https://en.wikipedia.org/wiki/Zarya)
is the name of the first module of the ISS).

```
ISS (ZARYA)
1 25544U 98067A   98324.28472222 -.00003657  11563-4  00000+0 0  9996
2 25544 051.5908 168.3788 0125362 086.4185 359.7454 16.05064833    05
```

I used Python library [`TLE-tools`](https://pypi.org/project/TLE-tools/) to
parse that TLE data.

<table>
  <tr>
    <th>SpaceTrack json output</th>
    <th>TLE parsed with TLE-tools</th>
  </tr>
  <tr valign="top">
    <td>
      <iframe style="background: #f8f8ff;" height="560" width="700" src="/data/spacetrack.output.json"></iframe>
    </td><td>
      <iframe style="background: #f8f8ff;"  height="310" src="/data/parsed.spacetrack.output.txt"></iframe>
    </td>
  </tr>
</table>

<a id="api" />
I'm still digesting TLE, but I already know what will be my first space-related
API: a TLE parser. More on that soon!
