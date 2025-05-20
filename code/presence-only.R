library(dplyr)
library(sf)
library(mapview)
library(gtsummary)
library(ggplot2)

nmfs_obs <-
  readr::read_csv("data/nmfs_obs.csv") |>
  janitor::clean_names()

nmfs_log <-
  readr::read_csv("data/nmfs_transect_log.csv") |>
  janitor::clean_names()

## getting transect log info

nmfs_obs <-
  nmfs_obs |>
  right_join(y = nmfs_log, by = "gis_key") |>
  mutate(count = tidyr::replace_na(count, 0))

##--- trends of observations over the years ----

## discarding other species (not that they don't matter)
nmfs_obs <- nmfs_obs |>
  filter(species == "HUWH")

nmfs_year <- nmfs_obs |>
  mutate(year = lubridate::year(date)) |>
  group_by(year) |>
  summarise(relative_obs = mean(count, na.rm = TRUE),
            absolute_obs = sum(count, na.rm = TRUE),
            entries      = sum(count > 0, na.rm = TRUE)) |>
  ungroup()

nmfs_year <-
  nmfs_year |>
  tidyr::pivot_longer(relative_obs:absolute_obs,
                      values_to = "obs",
                      names_to = "type")

ggplot(data = nmfs_year,
       aes(x = year,
           y = obs)) +
  geom_rect(ymin = 0, ymax = Inf,
            xmin = 2014, xmax = 2016,
            fill = 2,
            alpha = .5) +
  geom_point(aes(size = entries)) +
  geom_line() +
  facet_wrap(~ type, scales = "free_y") +
  theme_bw()

##--- entanglements data ----

entanglements <-
  readr::read_csv("data/entanglements.csv")

entanglements |>
  tidyr::pivot_longer(confirmed:total,
                      names_to = "type",
                      values_to = "entanglements") |>
  ggplot(data = _,
         aes(x = Year,
             y = entanglements)) +
  geom_rect(ymin = 0, ymax = 4000,
            xmin = 2014, xmax = 2016,
            fill = 2,
            alpha = .5) +
  geom_point() +
  geom_line() +
  facet_wrap(~ type,
             scales = "free_y") +
  theme_bw()

##--- relationship between entanglements and observations ----

nmfs_year |>
  left_join(entanglements, by = c("year" = "Year")) |>
  ggplot(data = _,
         aes(y = total,
             x = obs)) +
  geom_point(aes(color = year)) +
  geom_smooth(se = FALSE, method = "lm") +
  facet_wrap(~ type,
             scales = "free_x") +
  scale_color_viridis_c(option = "H") +
  theme_bw()
