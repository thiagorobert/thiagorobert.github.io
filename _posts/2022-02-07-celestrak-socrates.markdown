## Celestrak's source of conjunction data

I figured out where the conjunction information [available in Celestrak's
visualization](/2022/02/05/celestrak-resources.html#cdm) comes from.
[SOCRATES](https://celestrak.com/SOCRATES/) (*Satellite Orbital Conjunction
Reports Assessing Threatening Encounters in Space*) is a Celestrak service that
provides information on upcoming conjunctions.

It basically works by calculating potential conjunctions between satellites and
all other bodies using AGI's Systems Tool Kit ([STK](https://www.agi.com/products/stk))
Conjunction Analysis Tool ([CAT](https://www.agi.com/capabilities/conjunction-analysis-tool)).
The data is updated 3 times a day, and the visualization relies on a CSV
[file](https://celestrak.com/SOCRATES/sort-timein.txt) provided by Celestrak.

Note that SOCRATES provides a search tool that lets you query that data and 
save searches. I just performed a [search](https://celestrak.com/SOCRATES/search-results.php?IDENT=NAME&NAME_TEXT1=ZARYA&NAME_TEXT2=&CATNR_TEXT1=&CATNR_TEXT2=&ORDER=MAXPROB&MAX=25&B1=Submit)
for my favorite man-made satellite, the ISS. It looks like debris from `COSMOS 1408`,
the target of Russia's ASAT test on Nov 15th, 2021, remains the main threat to the ISS.
LeoLabs's medium page has an [in-depth analysis](https://leolabs-space.medium.com/analysis-of-the-cosmos-1408-breakup-71b32de5641f)
of that ASAT test and its fallout.

I also just read their [most recent post](https://leolabs-space.medium.com/leolabs-announces-operational-agreement-with-oneweb-fde505c0262e), which
contains amazing news: OneWeb is now a customer of LeoLab's Collision Avoidance service!
So the 3 largest satellite constellations (SpaceX, OneWeb, and Planet) are now
relying on LeoLabs for SSA, making it so roughly 60% of all operational satellites
in LEO rely on LeoLabs data for their safety. The post also contains good
technical details about the service. I learned that LeoLabs relies on SpaceTrak's
and customer's data to power their service, in addition to the data provided by
their network of [phased array radars](https://en.wikipedia.org/wiki/Phased_array).

