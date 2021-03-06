% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/availableSampleNames.R
\name{availableSampleNames}
\alias{availableSampleNames}
\title{Search an IDBac database to see which sample IDs have protein or small molecule data}
\usage{
availableSampleNames(checkedPool, whetherProtein, allSamples)
}
\arguments{
\item{checkedPool}{checkedPool}

\item{whetherProtein}{T/F protein spectra (T), small mol (F)}

\item{allSamples}{both protein and small mol? Takes precedence over whetherProtein}
}
\value{
vector of sample names in database with protein or small mol spectra
}
\description{
Search an IDBac database to see which sample IDs have protein or small molecule data
}
