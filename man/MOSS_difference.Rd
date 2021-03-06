% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/onestepSurvivalDifferenceR6.R
\docType{class}
\name{MOSS_difference}
\alias{MOSS_difference}
\title{onestep TMLE of difference survival curve}
\format{\code{\link{R6Class}} object.}
\usage{
MOSS_difference
}
\value{
Object of \code{\link{R6Class}} with methods
}
\description{
onestep TMLE of difference survival curve
}
\section{Fields}{

\describe{
\item{\code{dat}}{data.frame}

\item{\code{epsilon.step}}{float}

\item{\code{max.iter}}{int}

\item{\code{tol}}{float}

\item{\code{T.cutoff}}{int}

\item{\code{verbose}}{bool}
}}

\section{Methods}{

}

\examples{
# MOSS_difference$new(dat, epsilon.step = 1e-5, max.iter = 1e3, tol = 1/nrow(dat), T.cutoff = NULL, verbose = FALSE)
}
\keyword{data}
