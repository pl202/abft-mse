% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Objects.R
\docType{class}
\name{Obs-class}
\alias{Obs-class}
\title{An S4 class object that contains all observation model}
\description{
\describe{
\item{Name}{The name of the observation model object}
\item{Ccv}{a 2 item vector specifying the range in catch observation error as lognormal sd (upper lower)}
\item{Cbcv}{a 2 item vector specifying the maximum extend of catch bias as a lognormal sd}
\item{nCAAobs}{a 2 item vector specifying the range in the number of annual catch-at-age observations}
\item{nCALobs}{a 2 item vector specifying the range in the number of annual catch-at-length observations}
\item{Lcv}{the variance in lengths by age class log normal sd (currently unused)}
\item{Ibeta}{a 2 item vector representing the range of hyperstability in indices (currently unused)}
\item{Icv}{a 2 item vector representing bounds the degree of uncertainty (noise) in relative abundance indices as a lognormal sd (upper lower)(currently unused)}
\item{Mbcv}{a 2 item vector specifying the maximum extend of bias in natural mortality rate as a lognormal sd}
\item{Kbcv}{a 2 item vector specifying the maximum extend of bias in growth rate K as a lognormal sd}
\item{t0bcv}{a 2 item vector specifying the maximum extend of bias in growth parameter t0 as a normal cv}
\item{Linfbcv}{a 2 item vector specifying the maximum extend of bias in maximum size Linf as a lognormal sd}
\item{LFCbcv}{a 2 item vector specifying the maximum extend of bias in the length at first capture as a lognormal sd}
\item{LFSbcv}{a 2 item vector specifying the maximum extend of bias in the length at full selection as a lognormal sd}
\item{FMSYbcv}{a 2 item vector specifying the maximum extend of bias in simulated FMSY as a lognormal sd}
\item{FMSY_Mbcv}{a 2 item vector specifying the maximum extend of bias in simulated FMSY / natural mortality rate as a lognormal sd}
\item{BMSY_B0bcv}{a 2 item vector specifying the maximum extend of bias in simulated ratio of BMSY relative to unfished as a lognormal sd}
\item{ageMbcv}{a 2 item vector specifying the maximum extend of bias in simulated FMSY / natural mortality rate as a lognormal sd}
\item{Dbcv}{a 2 item vector specifying the maximum extend of bias in simulated depletion (current SSB relative to unfished) as a lognormal sd}
\item{Dcv}{a 2 item vector specifying the range in interannual variability in depletion (current SSB relative to unfished) lognormal sd}
\item{Btbcv}{a 2 item vector specifying the maximum extend of bias in simulated current biomass as a lognormal sd}
\item{Btcv}{a 2 item vector specifying the range in interannual variability in current biomass as a lognormal sd}
\item{Ftbcv}{a 2 item vector specifying the maximum extend of bias in simulated current exploitation rate as a lognormal sd}
\item{Ftcv}{a 2 item vector specifying the range in interannual variability in current exploitation rate as a lognormal sd}
\item{hbcv}{a 2 item vector specifying the maximum extend of bias in simulated steepness as a lognormal sd}
\item{Recbcv}{a 2 item vector specifying the maximum extend of bias in simulated recent recruitment strength rate as a lognormal sd}
\item{IMSYbcv}{a 2 item vector specifying the maximum extend of bias in simulated target relative abundance index as a lognormal sd}
\item{MSYbcv}{a 2 item vector specifying the maximum extend of bias in simulated MSY (a target catch rate) as a lognormal sd}
\item{BMSYbcv}{a 2 item vector specifying the maximum extend of bias in simulated BMSY (a target biomass level) as a lognormal sd}
\item{MPind}{a data frame containing the indices that may be used by MPs in closed loop simulation [year, index number, index name, index, CV, stock, type (1: vulnerable biomass, 2: ssb), source, applies to model areas]}
\item{MPind_stats}{a list containing the statistical properties of model fits (currently unused)}
}
}

