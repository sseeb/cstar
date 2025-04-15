library(sf)      ## spatial data
library(dplyr)   ## data manipulation
library(ggplot2) ## graphs

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
