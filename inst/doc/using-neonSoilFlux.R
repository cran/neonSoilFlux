## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
#  library(tidyverse)
#  library(neonSoilFlux)

## ----eval=FALSE---------------------------------------------------------------
#  out_env_data <- acquire_neon_data(site_name = 'SJER',
#                    download_date = '2021-06',
#                    )

## ----eval=FALSE---------------------------------------------------------------
#  # Extract data
#  VSWC_data <- out_env_data$site_data |>
#    filter(measurement == 'VSWC') |>
#    unnest(cols=c("data"))
#  
#  # Plot data
#  VSWC_data |>
#    ggplot(aes(x=startDateTime,y=VSWCMean)) +
#    geom_point(aes(color=as.factor(VSWCFinalQF))) +
#    facet_grid(verticalPosition~horizontalPosition)

## ----eval=FALSE---------------------------------------------------------------
#  out_fluxes <- compute_neon_flux(input_site_env = out_env_data$site_data,
#                    input_site_megapit = out_env_data$site_megapit
#                    )

## ----eval = FALSE-------------------------------------------------------------
#  env_fingerprint_plot(out_fluxes)

## ----eval = FALSE-------------------------------------------------------------
#  flux_fingerprint_plot(out_fluxes)

## ----eval=FALSE---------------------------------------------------------------
#  out_fluxes |>
#    select(-diffusivity) |>
#    unnest(cols=c(flux_compute)) |>
#    ggplot(aes(x=startDateTime,y=flux,color=method)) +
#      geom_line() +
#      facet_wrap(~horizontalPosition,scales = "free_y")

## ----eval=FALSE---------------------------------------------------------------
#  out_fluxes |>
#    select(-flux_compute) |>
#    unnest(cols=c(diffusivity)) |>
#    ggplot(aes(x=startDateTime,y=diffusivity,color=as.factor(zOffset))) +
#    geom_line() +
#    facet_wrap(~horizontalPosition,scales = "free_y")

