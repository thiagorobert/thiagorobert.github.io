---
layout: post
title: "Learning more about CDMs"
date: 2022-01-26 12:00:00 -0000
---

## Learning more about CDMs

One of the reasons for [satellite monitoring](/2022/01/03/satellite-tracking.html) is
to avoid collisions. Most modern satellites are capable of maneuvering out of harm's
way, at least until they run out of fuel. All they need is information
about possible threats, which is provided by the [Space Surveillance Network
(SSN)](https://en.wikipedia.org/wiki/United_States_Space_Surveillance_Network),
other government-level players, and [LeoLabs](https://www.leolabs.space/collision-avoidance/).

A conjunction event is the possibility of two objects in space colliding. In
other words, a close encounter. Conjunction Data Message (CDM) is the data
format used to inform satellite operators about this possibility.

A CDM includes information about both objects in question: unique id, size, type,
and more. CDMs also include information about the conjunction event itself:
probability of collision, miss distance, Time of Closest Approach (TCA), etc.

After a conjunction event is identified, more accurate CDMs are issued until the TCA.
In the interval between two to one days prior to TCA satellite operators must decide
whether to perform a collision avoidance maneuver ([source](https://arxiv.org/abs/2105.08509)).

SpaceTrack provides an API that lets you query CDMs.
[This query](https://www.space-track.org/basicspacedata/query/class/cdm_public/orderby/CDM_ID%20asc/limit/1/emptyresult/show)
yields the following data:
 
<p align="center"> 
  <iframe style="background: #f8f8ff;" height="340" width="340" src="/data/cdm.spacetrack.output.json"></iframe>
</p>

CDM `193725858` describes a conjunction event between two large objects,
`INTELSAT 2-F2` and `GORIZONT 29`, with TCA `2021-12-29 09:21:53.748000 (UTC)`.
It seems the probability of collision `PC` is unknown and the miss distance
`MIN_RNG` is 1737 miles (yes, believe it or not, the format uses miles for distance).
Note that I'm still trying to confirm my understanding of `PC` and `MIN_RNG`.
Despite the broken link in SpaceTrack, I found and skimmed
*CDM Recommended Standard 508.0-B-1* ([PDF download](https://public.ccsds.org/Pubs/508x0b1e2c2.pdf)),
but fields `PC` and `MIN_RNG` don't match what I saw on that spec.
         
Here's a public [LeoLabs CDM report](https://platform.leolabs.space/conjunctions/reports/2001817770)
for a conjunction event between `IRAS` and `GGSE 4` with TCA `2020-01-29 23:39:35.696000 UTC`.
The report is impressive, specially the mini-map that lets you follow
both object's orbits close to TCA and link to [amazing visualizations](https://platform.leolabs.space/visualizations/conjunction?type=conjunction&reportId=2001817770)
of the event:

<p align="center"> 
  <img src="/images/leolabs-cdm-visualization.png" title="LeoLabs CDM visualization" width="" />
</p>

Unfortunately, most other details linked from the
report (including the actual CDMs generated) require a LeoLabs account, which I
don't have (yet!).
