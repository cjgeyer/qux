qux <- function(func, state, ...)
{
    stopifnot(is.function(func))
    func2 <- function(x) func(x, ...)
    envir2 <- environment(fun = func2)
    .Call("qux", func2, envir2, state, PACKAGE = "qux")
}
