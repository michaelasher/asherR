% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/corAPA.R
\name{corAPA}
\alias{corAPA}
\title{Make a Correlation Matrix Suitable for an APA Publication}
\usage{
corAPA(
  x,
  missingMethod = c("pairwise", "complete"),
  format = c("kable", "df"),
  descriptives = T,
  removeTriangle = c("upper", "lower"),
  decimals = 2,
  cutoffs = c(0.001, 0.01, 0.05)
)
}
\arguments{
\item{x}{a matrix containing the data}

\item{missingMethod}{how missing observations are handled: "pairwise" by default.
"complete" selects only complete cases}

\item{format}{returns as either a "Kable" or a data frame}

\item{descriptives}{adds means and standard deviations}

\item{removeTriangle}{remove upper or lower triangle}

\item{decimals}{number of decimals in the correlation matrix}

\item{cutoffs}{a vector of 3 cutoffs values. p values less than cutoff 1 get 3 stars,
those less than cutoff 2 get 2 stars, and those less than cutoff 1 get one star}

\item{result}{the format of the output}
}
\value{
The correlation matrix in the desired format
}
\description{
This function creates a correlation matrix, given a data frame of variables,
and outputs it to the viewer in HTML Format to facilitate copying and pasting.
It uses stars to indicate significance.
}
