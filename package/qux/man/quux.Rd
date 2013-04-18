\name{quux}
\alias{quux}
\title{Call R from Fortran}
\description{Like it says.}
\usage{
quux(func, state, ...)
}
\arguments{
  \item{func}{an R function to be evaluated.  It should have signature
      \code{function(state, ...)} or \code{function(state)} if no additional
      arguments are needed.  It must return a numeric vector with all values
      finite (no \code{NA} or  \code{NaN}, no \code{Inf} or \code{-Inf}.}
  \item{state}{first argument for \code{func}.}
  \item{...}{additional arguments for \code{func}.}
}
\details{
Function \code{func} must have \code{state} a numeric vector and return
a numeric scalar (vector of length one).
}
\value{the result of the function call.}
\examples{
quux(function(x) sum(x^3), state = 1:5)
}
\keyword{misc}

