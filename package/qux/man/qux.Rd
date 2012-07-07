\name{qux}
\alias{qux}
\alias{quacks}
\title{Call R from C}
\description{Like it says.}
\usage{
qux(func, state, ...)
quacks(func, state, len, ...)
}
\arguments{
  \item{func}{an R function to be evaluated.  It should have signature
      \code{function(state, ...)} or \code{function(state)} if no additional
      arguments are needed.  It must return a numeric vector with all values
      finite (no \code{NA} or  \code{NaN}, no \code{Inf} or \code{-Inf}.}
  \item{state}{first argument for \code{func}.}
  \item{len}{length of the result of \code{func}.}
  \item{...}{additional arguments for \code{func}.}
}
\value{the result of the function call.}
\examples{
qux(function(x) outer(x, x), state = 1:5)
quacks(function(x) x^2, state = 1:5, 5)
}
\keyword{misc}

