% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MSE_functions.R
\name{getperf}
\alias{getperf}
\title{Calculate performance metrics.}
\usage{
getperf(MSE)
}
\arguments{
\item{MSE}{an object of class MSE}
}
\value{
a list n stocks long each with a data frame of performance metrics (columns) by management procedure (row) \code{MSE}.
\itemize{
  \item Y10. Mean yield over the first 10 years of the projection
  \item Y20. Mean yield over years 11-20 of the projection
  \item Y30. Mean yield over years 21-30 of the projection
  \item PGK. Probability of Green Kobe (F<FMSY AND B>BMSY) region over all years of the projection
  \item POF. Probability of Over-Fishing (F>FMSY) over all years of the projection
  \item POFed. Probability of Over-Fished status (B<BMSY) over all years of the projection
  \item D10. Mean depletion (SSB relative to unfished) over the first 10 years of the projection
  \item D20. Mean depletion (SSB relative to unfished) over years 11-20 of the projection
  \item D30. Mean depletion (SSB relative to unfished) over years 21-30 of the projection
  \item LD. Mean depletion (SSB relative to unfished) over all projected years
  \item RSSB. Mean Spawning Stock Biomass in final projection year relative to zero fishing
  \item LRSSB. Mean Spawning Stock Biomass over all projection years relative to zero fishing
  \item AAVY. Mean Average Annual Variability in Yield over all projections
  \item carat. weight of the diamond (0.2--5.01)
  ...
}
}
\description{
Calculate performance metrics.
}
\examples{
getperf(MSE_example)
}

