library(dplyr)
library(sf)
library(mapview)
library(gtsummary)

## CALCOFI

calcofi_tlog <-
  readr::read_csv("data/calcofi_transect_log.csv") |>
  janitor::clean_names()

calcofi_obs <-
  readr::read_csv("data/calcofi_obs.csv") |>
  janitor::clean_names()

## HUWH is the Humpback Whale code

## NMFS

nmfs_tlog <-
  readr::read_csv("data/nmfs_transect_log.csv") |>
  janitor::clean_names()

nmfs_tlog |>
  select(- gis_key) |>
  gtsummary::tbl_summary()

nmfs_obs <-
  readr::read_csv("data/nmfs_obs.csv") |>
  janitor::clean_names()

## CPR

cpr_tlog <-
  readr::read_csv("data/cpr_transect_log.csv") |>
  janitor::clean_names()

cpr_obs <-
  readr::read_csv("data/cpr_obs.csv") |>
  janitor::clean_names()

##
nmfs_tlog |>
  filter(lubridate::year(date) == 2021) |>
  st_as_sf(coords = c("longitude_mid_ao", "latitude_mid_ao"),
           crs = st_crs("epsg:4326")) |>
  mapview()

##--- creating blob variable ----

nmfs_tlog |>
  mutate(year = lubridate::year(date)) |>
  mutate(blob = if_else(between(year, 2014, 2016),
                        "Yes", "No")) |>
  mutate(blob_cat =
           if_else(between(year, 2014, 2016),
                   "Yes", "No")) |>
  count(year, blob) |>
  print(n = Inf)

nmfs_tlog |>
  st_as_sf(coords = c("longitude_mid_ao", "latitude_mid_ao"),
           crs = st_crs("epsg:4326")) |>
  st_bbox()
