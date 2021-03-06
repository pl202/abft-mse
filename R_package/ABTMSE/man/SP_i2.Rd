% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MPs.R
\docType{data}
\name{SP_i2}
\alias{SP_i2}
\title{A 3 parameter surplus production assessmetn using INDEX 2 (observation error only)(a management procedure of class MP).}
\format{An object of class \code{MP} of length 1.}
\usage{
SP_i2
}
\arguments{
\item{x}{a simulation number.}

\item{dset}{a list of simulated data for use by management procedures.}
}
\value{
a TAC recommendation arising from \code{x, dset}.
}
\description{
A 3 parameter surplus production assessmetn using INDEX 2 (observation error only)(a management procedure of class MP).
}
\examples{
SP_i2(1,dset_example_East)
sapply(1:10,SP_i2,dset_example_East)
}
\keyword{datasets}

