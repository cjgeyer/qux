quux <- function(func, state, ...)
{
    stopifnot(is.function(func))
    stopifnot(is.numeric(state))
    stopifnot(is.finite(state))
    func2 <- function(x) func(x, ...)
    envir2 <- environment(fun = func2)
    .Call("setupfunction", func2, envir2, PACKAGE = "qux")
    out <- .Fortran("exercise", state = as.double(state),
        n = length(state), result = double(1), PACKAGE = "qux")
    return(out$result)
}
