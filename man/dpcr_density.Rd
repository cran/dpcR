% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dpcr_density.R
\name{dpcr_density}
\alias{dpcr_density}
\title{Calculate Density of Single dPCR Run}
\usage{
dpcr_density(k, n, average = FALSE, methods = "wilson",
  conf.level = 0.95, plot = TRUE, bars = FALSE, ...)
}
\arguments{
\item{k}{Total number of positive molecules.}

\item{n}{Total number of partitions.}

\item{average}{If \code{TRUE}, calculates density of the average number of
molecules per partition. If \code{FALSE}, instead performs calculations for
the total number of positive molecules.}

\item{methods}{Method for calculating the confidence interval. 
Possible values are: \code{"wilson"}, \code{"agresti-coull"},
\code{"exact"}, \code{"prop.test"}, \code{"profile"}, \code{"lrt"},
\code{"asymptotic"}, \code{"bayes"}, \code{"cloglog"}, \code{"logit"},
\code{"probit"}. Default value is \code{"wilson"}. See Details.}

\item{conf.level}{The level of confidence to be used in the confidence
interval. Values from 0 to 1 and -1 to 0 are acceptable.}

\item{plot}{If \code{TRUE}, plots density plot.}

\item{bars}{plot on density plot bars for discrete values of lambda.}

\item{...}{Additional arguments send to \code{plot} function.}
}
\value{
A data frame with one row containing bounds of the confidence
intervals and a name of the method used to calculate them.
}
\description{
Calculates and plots the density of the number of positive
molecules or the average number of molecules per partition. Can be used for
both array digital PCR and droplet digital PCR.
}
\examples{

# Calculate the average number of molecules per partition and show the area
# of the confidence interval (left plot) and the area within the 
# confidence interval
oldpar <- par(mfrow = c(1,1))
par(mfrow = c(1,2))
dpcr_density(k = 25, n = 55, average = TRUE, methods = "wilson", 
	     conf.level = 0.95)
dpcr_density(k = 25, n = 55, average = TRUE, methods = "wilson", 
	     conf.level = -0.95)
par(oldpar)

# By setting average to FALSE the total number of positive molecules is 
# calculated
dpcr_density(k = 25, n = 55, average = FALSE, methods = "wilson", 
	     conf.level = 0.95)

}
\references{
Brown, Lawrence D., T. Tony Cai, and Anirban DasGupta.
\emph{Confidence Intervals for a Binomial Proportion and Asymptotic
Expansions.} The Annals of Statistics 30, no. 1 (February 2002): 160--201.
}
\seealso{
Computation of confidence intervals: \link[binom]{binom.confint}, 

The browser-based graphical user interface for this function: \link{dpcr_density_gui}.
}
\author{
Michal Burdukiewicz, Stefan Roediger.
}
\keyword{dplot}
\keyword{hplot}
