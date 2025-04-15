## Structure

To mantain the **repository organized** and make it easier for other people to
understand it, I tend to keep the following simple **structure**:

- scripts are placed in `code`.

- datasets in `data`

- documentation in `docs`

Sometimes, it is convenient to have sub-directories (folders) for `data`. For
instance, we could have `data/raw` storing raw data, and `data/processed`
storing the datasets we already pre-processed.

## Goals

- Familiarize ourselves with **GitHub**
  - Always use `git pull` before you start working;
  - `git pull --rebase` may be helpful on solving conflicts.

- **Coding style**: we should try to follow coding conventions to make it easier
  for others to read each others code. I know not all people are "tidyverse"
  enthusiasts, however, their style guide is still quite useful. Check this
  [link](https://style.tidyverse.org/).

- Discuss the **repository structure**. Some of the options are:
  - Working on separate scripts (pros: avoids conflicts; cons: it makes it
    harder to organize the repo.)

## R as a GIS

In the file `code/read-dt.R`, I wrote a simple code to read the data we will
work with. Next, I used the [`sf`](https://r-spatial.github.io/sf/) package to
transform the `data.frame` into a spatial object.

The tasks I planned are:

1. Understand what is going on in the `code/read-dt.R` file.
2. What are the lines 17 to 22 doing?
3. What is a Coordinate Reference System (CRS)?
4. Trying to use maps and descriptive statistics to understand the data and come
   up with some interesting research questions.
5. Other "spatial" packages to check: 
   - Mostly for raster data: `terra`, `raster`;
   - Interactive maps: `tmap`, `mapview`, `leaflet`, 
   - Storing data efficiently: `geoarrow`

> P.s.: I had to guess the CRS for this data. The
> [epsg:4326](https://spatialreference.org/ref/epsg/4326/) is usually a good
> guess.

## Data info

From: https://oceaninformatics.ucsd.edu/datazoo/catalogs/ccelter/datasets/262

### General Effort Protocols

Observers are always on effort when ship moving at 5+ knots and weather permits
(on all transits, both on and off transect). There should always be 2 observers
present. Observations should begin as soon as the ship has left
station. Observer on port side scans from bow to 90 degrees left, from ship to
horizon. Observer on starboard side scans from bow to 90 degrees right, from
ship to horizon. Binoculars should be used for scanning approximately half of
the time to scan from ship to horizon. Observations occur until Beaufort 6,
rain, or fog reduces visibility to 0.5 nmi or less. While off effort due to
weather, at least one observer watches for changes in weather and opportunistic
sightings.

### Sightings Protocols

Sighting numbers are cumulative throughout the cruise. Sightings are considered
on-effort when: 2 observers are present; Beaufort sea state 5 or less,
visibility greater than 0.5 nmi; Ship is traveling along prescribed CalCOFI
trackline; Ship speed is greater than or equal to 5 knots. Species ID may be
confirmed via Big Eyes. Photos of sightings may be taken to verify species ID,
though photo effort should not interfere with visual effort.
