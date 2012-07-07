#include <R.h>
#include <Rinternals.h>

SEXP qux(SEXP func, SEXP envir, SEXP state)
{
    if (! isFunction(func))
        error("argument \"func\" must be function");
    if (! isEnvironment(envir))
        error("argument \"envir\" must be environment");

    SEXP call, result;
    PROTECT(call = lang2(func, state));
    PROTECT(result = eval(call, envir));

    if (! isVectorAtomic(result))
        error("result of function call must be atomic");
    if (! isNumeric(result))
        error("result of function call must be numeric");

    SEXP foo;
    PROTECT(foo = coerceVector(result, REALSXP));
    int len = LENGTH(foo);
    for (int i = 0; i < len; i++)
        if (! R_finite(REAL(foo)[i]))
            error("function returned vector with non-finite element");
    UNPROTECT(3);
    return foo;
}
