% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helper_for_onestep.R
\name{compute_step_cdf}
\alias{compute_step_cdf}
\title{compute cumulative distribution function of a step-shaped (empirical) density}
\usage{
compute_step_cdf(pdf.mat, t.vec, start = -Inf)
}
\arguments{
\item{pdf.mat}{if input vector = compute cdf for a step-function pdf;
if input matrix = compute cdf for several step-function pdf with same jump points}

\item{t.vec}{unique jump points of step function}

\item{start}{if -Inf = from left to right; if Inf = from right to left.}
}
\value{
vector of cdf value
}
\description{
compute cumulative distribution function of a step-shaped (empirical) density
}
