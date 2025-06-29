% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/classes.R
\docType{class}
\name{adpcr-class}
\alias{adpcr-class}
\alias{adpcr}
\title{Class \code{"adpcr"} - end-point array digital PCR experiments}
\description{
A class specifically designed to contain results from end-point array
digital PCR experiments. Data is represented as matrix, where each column
describes different experiment. Type of data in all columns is specified in
slot \code{"type"}. Inherits from \code{\linkS4class{dpcr}}.
}
\details{
For more in-depth explanation of digital PCR data structure, see 
\code{\linkS4class{dpcr}}.
}
\section{Slots}{

\describe{
\item{\code{col_names}}{\code{"character"} vector naming columns in the array.}

\item{\code{row_names}}{\code{"character"} vector naming rows in the array.}

\item{\code{row_id}}{\code{"integer"} vector providing row indices of all runs.}

\item{\code{col_id}}{\code{"integer"} vector providing column indices of all runs.}

\item{\code{panel_id}}{\code{"factor"} naming the panel to which experiment belong.}
}}

\examples{

rand_array <- sim_adpcr(400, 1600, 100, pos_sums = FALSE, n_panels = 5)
one_rand_array <- extract_run(rand_array, 1)
plot_panel(one_rand_array, 40, 40)

}

\seealso{
Data management: \code{\link{adpcr2panel}}, \code{\link{bind_dpcr}},
\code{\link{extract_run}}.

Plotting: \code{\link{plot_panel}}.

Tests: \code{\link{test_panel}}.

Simulation: \code{\link{sim_adpcr}}.

Real-time array digital PCR: \code{\linkS4class{rtadpcr}}.

Droplet digital PCR: \code{\linkS4class{dpcr}}.
}
\author{
Michal Burdukiewicz.
}
\keyword{classes}
