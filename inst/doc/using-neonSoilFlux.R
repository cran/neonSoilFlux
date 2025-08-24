## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----diagram, echo = FALSE, fig.cap = "Model diagram for data workflow for the `neonSoilFlux` R package. a) Acquire: Data are obtained from given NEON location and horizontal sensor location, which includes soil water content, soil temperature, CO$_{2}$ concentration, and atmospheric pressure. All data are screened for quality assurance; if gap-filling of missing data occurs, it is flagged for the user. b) Any belowground data are then harmonized to the same depth as CO$_{2}$ concentrations using linear regression. c) The flux across a given depth is computed via Fick's law, denoted with $F_{ijk}$, where $i$, $j$, or $k$ are either 0 or 1 denoting the layers the flux is computed across ($i$ = closest to surface, $k$ = deepest). $F_{000}$ represents a flux estimate where the gradient $dC/dz$ is the slope of a linear regression of CO$_{2}$ with depth.", out.width = '100%'----
knitr::include_graphics("model-diagram.png")

## ----eval = FALSE-------------------------------------------------------------
# library(tidyverse)
# library(neonSoilFlux)

## ----eval=FALSE---------------------------------------------------------------
# out_env_data <- acquire_neon_data(site_name = 'SJER',
#                   download_date = '2022-06',
#                   )

## ----eval=FALSE---------------------------------------------------------------
# # Extract data
# VSWC_data <- out_env_data$site_data |>
#   filter(measurement == 'VSWC') |>
#   unnest(cols=c("data"))
# 
# # Plot data
# VSWC_data |>
#   ggplot(aes(x=startDateTime,y=VSWCMean)) +
#   geom_point(aes(color=as.factor(VSWCFinalQF))) +
#   facet_grid(verticalPosition~horizontalPosition) +
#   labs(color = "QF Flags")

## ----eval=FALSE---------------------------------------------------------------
# out_fluxes <- compute_neon_flux(input_site_env = out_env_data$site_data,
#                   input_site_megapit = out_env_data$site_megapit
#                   )

## ----eval = FALSE-------------------------------------------------------------
# env_fingerprint_plot(out_fluxes$millington_quirk)

## ----eval = FALSE-------------------------------------------------------------
# flux_fingerprint_plot(out_fluxes$millington_quirk)

## ----eval=FALSE---------------------------------------------------------------
# out_fluxes$marshall |>   # Can also use millington-quirk
#   select(-diffusivity) |>
#   unnest(cols=c(flux_compute)) |>
#   ggplot(aes(x=startDateTime,y=flux,color=method)) +
#     geom_line() +
#     facet_wrap(~horizontalPosition,scales = "free_y")

## ----eval=FALSE---------------------------------------------------------------
# out_fluxes$marshall |> # Can also use millington-quirk
#   select(-flux_compute) |>
#   unnest(cols=c(diffusivity)) |>
#   ggplot(aes(x=startDateTime,y=diffusivity,color=as.factor(zOffset))) +
#   geom_line() +
#   facet_wrap(~horizontalPosition,scales = "free_y")

