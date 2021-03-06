% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multiSummaryImp.R
\name{multiSummaryImp}
\alias{multiSummaryImp}
\title{Summarize the output from multiple regression models with imputed data}
\usage{
multiSummaryImp(..., Stars = F, Output = "markdown")
}
\arguments{
\item{...}{up to 8 linear models, produced by lm}

\item{Stars}{adds significance stars for the last model, if requested}

\item{Output}{specifies if the function returns a dataframe or a markdown file}
}
\value{
The regression table
}
\description{
This function creates a summary table for a linear model with imputed data, and outputs it to the
viewer in HTML Format to facilitate copying and pasting by default. By default it outputs
standardized betas for regression coefficients, and it can accept
up to 8 models as arguments, which makes it ideal for displaying models with multiple
steps.
}
