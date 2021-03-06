% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Implementation_models.R
\docType{data}
\name{Overage_20}
\alias{Overage_20}
\title{TAC overages of 20 per cent are simulated up to a maximum harvest rate of 90per cent (an implementation error function of class IE)}
\format{An object of class \code{IE} of length 1.}
\usage{
Overage_20
}
\arguments{
\item{U}{A numeric value, vector or array of harvest rates}
}
\value{
an object of dimensions U with a harvest rate cap \code{U, over, maxU}
}
\description{
TAC overages of 20 per cent are simulated up to a maximum harvest rate of 90per cent (an implementation error function of class IE)
}
\examples{
Overage_20((1:10)/10)
}
\keyword{datasets}

