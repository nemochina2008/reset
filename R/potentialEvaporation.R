#' Potential evaporation
#'
#' @description
#' Calculate the potential evaporation. Currently available equations include
#' Priestley and Taylor (1972).
#'
#' @param Rn \code{numeric} or \code{Raster*} object, net radiation (MJ m-2
#' day-1).
#' @param G \code{numeric} or \code{Raster*} object, soil heat flux (MJ m-2
#' day-1).
#' @param delta \code{numeric} or \code{Raster*} object, slope of the saturation
#' vapor pressure curve (kPa / deg C) at air temperature, e.g. derived from
#' \code{\link{vaporPressureSat}}.
#' @param gamma \code{numeric} or \code{Raster*} object, psychrometric constant
#' (kPa / deg C), e.g. derived from \code{\link{psychrometricConstant}}.
#' @param alpha \code{numeric}, Priestley-Taylor constant, defaults to 1.26
#' for advection-free saturated surfaces (see References).
#'
#' @return
#' If any of the inputs is a \code{Raster*} object, a \code{Raster*} object;
#' else a \code{numeric} object (in mm per logging interval).
#'
#' @seealso
#' \code{\link{vaporPressureSat}}, \code{\link{psychrometricConstant}}.
#'
#' @references
#' McMahon TA, Peel MC, Lowe L, Srikanthan R, McVicar TR (2013) Estimating
#' actual, potential, reference crop and pan evaporation using standard
#' meteorological data: a pragmatic synthesis. \emph{Hydrology and Earth System
#' Sciences} 17, 1331-1363, doi:10.5194/hess-17-1331-2013.
#'
#' Priestley CHB, Taylor RJ (1972) On the assessment of surface heat flux and
#' evaporation using large scale parameters. \emph{Monthly Weather Reviews} 100,
#' 81-92, doi:10.1175/1520-0493(1972)100<0081:OTAOSH>2.3.CO;2.
#'
#' @export potentialEvaporation
#' @name potentialEvaporation
potentialEvaporation <- function(Rn, G, delta, gamma, alpha = 1.26) {

  ## define constants
  lambda <- 2.45   # latent heat of vaporization

  ## compute potential evaporation
  alpha * (delta / (delta + gamma) * Rn / lambda - G / lambda)
}
