library(sf)      ## spatial data
library(dplyr)   ## data manipulation
library(ggplot2) ## graphs
library(skimr)
library(sf)

##--- pre processing ----

## reading data
my_dt <- readr::read_csv("data/data.csv")
# automatically detects the data type per column, fixes dates

## cleaning column names
my_dt <- janitor::clean_names(my_dt)

glimpse(my_dt)

## turning the dataset into a spatial object

my_crs <- st_crs("epsg:4326")
my_crs_2 <- st_crs("epsg:4269") # what happens if we change the CRS??

my_dt <- my_dt |>
  st_as_sf(coords = c("decimal_longitude_o",
                      "decimal_latitude_o"),
           crs = my_crs)
           # crs = my_crs_2)

## quick dataviz

ggplot(data = my_dt) +
  geom_sf(aes(color = wind_speed_t)) +
  scale_color_viridis_c(option = "H",
                        trans = "log1p") +
  theme_minimal()

# dropping spatial part of df
my_dt %>% 
  st_drop_geometry() %>% # bc we don't need to get summary data for geometry data
  skimr::skim() # tells us cool stuff about dataset

skim(cars)

my_dt <- my_dt %>% 
  mutate(species_1 = toupper(species_1),
         species_2 = toupper(species_2))


## merging species with "UNID" in their name
my_dt <- my_dt |>
  mutate(species_p_1 = if_else(grepl("(^U|UNID)", species_1), "UNID", species_1),
         species_p_2 = if_else(grepl("(^U|UNID)", species_2), "UNID", species_2))
# hat says "something that starts with", bar says "or"

my_dt |>
  st_drop_geometry() |>
  count(species_p_1) |> # you can also count by multiple variables
  arrange(-n) |> # arrange in descending order of count
  mutate(pc = 100 * n / sum(n)) |>
  print(n = Inf) # so it prints the whole table

my_dt |>
  st_drop_geometry() |>
  count(event_code) |>
  arrange(-n) |>
  print(n = Inf)
