quacks <- function(func, state, len, ...)
{
    stopifnot(is.function(func))
    stopifnot(is.atomic(state))
    stopifnot(is.numeric(state))
    stopifnot(is.numeric(len))
    stopifnot(length(len) == 1)
    stopifnot(len == as.integer(len))
    func2 <- function(x) {
        ans <- func(x, ...)
        stopifnot(is.atomic(ans))
        stopifnot(is.numeric(ans))
        ans <- as.double(ans)
        stopifnot(length(ans) == len)
        return(ans)
    }
    envir2 <- environment(fun = func2)
    out <- .C("quacks", func = func2, state = as.double(state),
        len = as.integer(length(state)), result = double(len),
        lenresult = as.integer(len), PACKAGE = "qux")
    return(out$result)
}
