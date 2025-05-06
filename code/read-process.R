library(sf)      ## spatial data
library(dplyr)   ## data manipulation
library(ggplot2) ## graphs
library(leaflet)
library(mapview)

##--- pre processing ----

## reading data
my_dt <- readr::read_csv("data/data.csv")

## cleaning column names
my_dt <- janitor::clean_names(my_dt)

glimpse(my_dt)

## turning the dataset into a spatial object
my_crs <- st_crs("epsg:4326")

my_dt <- my_dt |>
  st_as_sf(coords = c("decimal_longitude_o",
                      "decimal_latitude_o"),
           crs = my_crs)

## quick dataviz
ggplot(data = my_dt) +
  geom_sf(aes(color = wind_speed_t)) +
  scale_color_viridis_c(option = "H",
                        trans = "log1p") +
  theme_minimal()

mapview(my_dt["wind_speed_t"])

## skiming the data
my_dt |>
  st_drop_geometry() |>
  skimr::skim()

##--- cleaning species ----
## species to upper case
my_dt <- my_dt |>
  mutate(species_1 = toupper(species_1),
         species_2 = toupper(species_2),
         event_code = toupper(event_code))

my_dt |>
  st_drop_geometry() |>
  count(species_1) |>
  arrange(-n) |>
  print(n = Inf)

## check if NAs in cue and species coincide
my_dt |>
  st_drop_geometry() |>
  count(event_code) |>
  arrange(-n) |>
  print(n = Inf)

## checking proportion of unidentified species
my_dt |>
  st_drop_geometry() |>
  mutate(unind = if_else(grepl("UNID", species_1), "YES", "NO")) |>
  count(unind) |>
  mutate(pc = n / sum(n))

## merging species with "UNID" in their name
my_dt <- my_dt |>
  mutate(species_p_1 = if_else(grepl("(^U|UNID)", species_1), "UNID", species_1),
         species_p_2 = if_else(grepl("(^U|UNID)", species_2), "UNID", species_2))

my_dt |>
  st_drop_geometry() |>
  count(species_p_1) |>
  arrange(-n) |>
  mutate(pc = 100 * n / sum(n)) |>
  print(n = Inf)

my_dt |>
  st_drop_geometry() |>
  count(effort_on_off, species_p_1) |>
  arrange(effort_on_off, -n) |>
  mutate(pc = 100 * n / sum(n)) |>
  print(n = Inf)

## check if any species are spotted during the event code "W", which means
## "weather update"
my_dt |>
  st_drop_geometry() |>
  filter(event_code == "W") |>
  count(species_p_1) |>
  arrange(-n)

## Cleaning effort variable
## -- everything to uppercase and replacing 0 with O.
my_dt <- my_dt |>
  mutate(effort_on_off = if_else(effort_on_off == "OM",
                                 "ON",
                                 toupper(gsub("0", "O", effort_on_off))))

my_dt <- my_dt |>
  mutate(effort_on_off = if_else(effort_on_off == "92",
                                 NA_character_,
                                 effort_on_off))

my_dt |>
  st_drop_geometry() |>
  count(effort_on_off)

## Cleaning transect variable
## -- everything to uppercase and replacing 0 with O.
my_dt |>
  st_drop_geometry() |>
  count(transect_on_off)

my_dt <- my_dt |>
  mutate(transect_on_off = toupper(gsub("0", "O", transect_on_off)))

my_dt |>
  st_drop_geometry() |>
  count(transect_on_off)

##--- looking at event code ----

my_dt |>
  st_drop_geometry() |>
  count(event_code) |>
  arrange(- n) |>
  print(n = Inf)

##--- looking at event code ----

my_dt |>
  st_drop_geometry() |>
  count(cruise) |>
  arrange(- n) |>
  print(n = Inf)

##--- looking at the "transect on" "effort on" data ----

my_dt |>
  filter(effort_on_off == "ON",
         transect_on_off == "ON") |>
  select(wind_speed_t) |>
  mapview()

##--- checking species names ----

all_species <- readr::read_csv("data/1488405241_allspecieslist.csv") |>
  janitor::clean_names()
