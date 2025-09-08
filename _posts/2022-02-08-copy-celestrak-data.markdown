---
layout: post
title: "Periodically copying data from Celestrak"
date: 2022-02-08 12:00:00 -0000
---

## Periodically copying data from Celestrak

I just added a new feature to the Space service I've been working on. It will now
periodically copy interesting data from Celestrak and make it available at <http://api.thiago.pub:9092/>.

This data will allow me to make the existing UI (currently at <http://api.thiago.pub:8080/>)
a bit more streamlined. E.g., instead of having to enter a TLE, the user will be
able to select any of the entries in [`stations`](http://api.thiago.pub:9092/stations-latest.txt)
via a dropdown. 

I might also try and figure out a good way to display information from the latest
SOCRATES [data](http://api.thiago.pub:9092/socrates-latest.txt) in the UI.
