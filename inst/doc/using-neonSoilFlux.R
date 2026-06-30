## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
# neonSoilFlux::neon_api_token("YOUR_TOKEN_HERE", install = TRUE)

## ----eval = FALSE-------------------------------------------------------------
# library(tidyverse)
# library(neonSoilFlux)
# library(neonUtilities)

## ----eval=FALSE---------------------------------------------------------------
# out_env_data <- acquire_neon_data(site_name = 'SJER',
#                   download_date = '2022-06'
#                   )

## ----eval=FALSE---------------------------------------------------------------
# library(tidyverse)
# 
# # Extract data
# VSWC_data <- out_env_data$site_data |>
#   filter(measurement == 'VSWC') |>
#   unnest(cols=c("data"))
# 
# # Plot data
# VSWC_data |>
#   ggplot(aes(x=startDateTime,y=VSWCMean)) +
#   geom_point(aes(color=as.factor(VSWCFinalQF))) +
#   facet_grid(verticalPosition~horizontalPosition)

## ----eval=FALSE---------------------------------------------------------------
# out_fluxes <- compute_neon_flux(
#   input_site_env = out_env_data$site_data,
#   input_site_megapit = out_env_data$site_megapit
#   )

## ----eval = FALSE-------------------------------------------------------------
# env_fingerprint_plot(out_fluxes)

## ----eval = FALSE-------------------------------------------------------------
# # Fingerprint plot for Marshall method:
# flux_fingerprint_plot(
#   input_fluxes = out_fluxes,
#   input_diffus_method = "Marshall")
# 
# # Fingerprint plot for Marshall method:
# flux_fingerprint_plot(
#   input_fluxes = out_fluxes,
#   input_diffus_method = "Millington-Quirk")
# 

## ----eval=FALSE---------------------------------------------------------------
# out_fluxes |>
#   select(-surface_diffusivity) |>
#   unnest(cols=c(flux_compute)) |>
#   ggplot(aes(x=startDateTime,y=flux,color=method)) +
#     geom_line() +
#     facet_wrap(~horizontalPosition,scales = "free_y")

## ----eval=FALSE---------------------------------------------------------------
# out_fluxes |>
#   select(-flux_compute) |>
#   unnest(cols=c(surface_diffusivity)) |>
#   ggplot(aes(x=startDateTime,y=diffusivity,color=as.factor(zOffset))) +
#   geom_line() +
#   facet_wrap(~horizontalPosition,scales = "free_y")

