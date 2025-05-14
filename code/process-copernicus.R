library(sf)
library(stars)
library(dplyr)
library(ggplot2)
library(geoarrow)
library(arrow)

##--- read data ----

## data was downloaded using:
## copernicusmarine subset --request-file north-atlantic.json
## on a terminal (note that, one would have to install the copernicusmarine CLI)

copernicus_file <-
  "data/copernicus/cmems_mod_glo_phy_my_0.083deg_P1M-m_multi-vars_125.33W-117.25W_32.50N-46.25N_0.49-5727.92m_1993-01-01-2021-06-01.nc"

stars_ncdf <-
  read_mdim(copernicus_file)

##--- processing ----

## dropping depth (at least for now)
stars_ncdf <-
  stars_ncdf[, ,  ,1] |>
  adrop()

## the data is available monthly
## time_points <- c(sprintf("%d-09-01 UTC", 1993:2021), ## september
##                  sprintf("%d-03-01 UTC", 1993:2021)) ## march

## for now, using only April
time_points <- sprintf("%d-04-01 UTC", 1993:2021)

time_points <- sapply(time_points, as.POSIXct, tz = "UTC")

## filtering march and september
stars_ncdf <-
  stars_ncdf |>
  filter(time %in% time_points)

## varu

temperature <-
  stars_ncdf |>
  st_as_sf(as_points = TRUE,
           merge = FALSE,
           long = TRUE)

##--- saving data ----

write_parquet(temperature,
              "data/copernicus/processed.parquet")
## file.remove(copernicus_file)

temperature |>
  filter(time == lubridate::as_date("2021-04-01")) |>
  mutate(sst = units::set_units(thetao, NULL)) |>
  ggplot(data = _) +
  geom_sf(aes(color = sst),
          pch = 15) +
  ## geom_sf(data = base_map) +
  ## geom_sf_text(data = base_map,
  ##              aes(label = postal),
  ##              size = 2) +
  scale_color_viridis_c(option = "H") +
  labs(x = NULL, y = NULL,
       title = "SST",
       color = "SST") +
  theme_minimal() +
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        legend.position = "inside",
        legend.position.inside = c(0.8, 0.8),
        legend.key.size = unit(.3, units = "cm"),
        legend.title = element_blank(),
        ## legend.background = element_rect(color = 1,
        ##                                  linewidth = .1),
        ## legend.text = element_text(size = 5),
        legend.text.position = "left")


temperature |>
  filter(time == lubridate::as_date("2021-04-01")) |>
  mutate(sst = units::set_units(thetao, NULL)) |>
  select(sst) |>
  mapview::mapview()
