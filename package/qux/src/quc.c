
#include <R.h>
#include <Rinternals.h>

static SEXP thefunction = NULL;
static SEXP theenvironment = NULL;

SEXP setupfunction(SEXP func, SEXP rho)
{
    if (! isFunction(func))
        error("argument \"func\" must be function");
    if (! isEnvironment(rho))
        error("argument \"rho\" must be environment");
    thefunction = func;
    theenvironment = rho;
    return(ScalarLogical(TRUE));
}

double F77_SUB(doit)(double *x, int *n)
{
    if (! isFunction(thefunction))
        error("setupfunction needs to be called first");
    if (! isEnvironment(theenvironment))
        error("setupfunction needs to be called first");

    SEXP state;
    PROTECT(state = allocVector(REALSXP, n[0]));
    for (int i = 0; i < n[0]; i++)
        REAL(state)[i] = x[i];

    SEXP call, result;
    PROTECT(call = lang2(thefunction, state));
    PROTECT(result = eval(call, theenvironment));

    if (! isVectorAtomic(result))
        error("result of function call must be atomic");
    if (! isNumeric(result))
        error("result of function call must be numeric");
    if (LENGTH(result) != 1)
        error("result of function call must be scalar");
    double foo = NA_REAL;
    if (isReal(result)) {
        foo = REAL(result)[0];
        if (! R_FINITE(foo))
            error("result of function call was not finite");
    } else if (isInteger(result)) {
        int bar = INTEGER(result)[0];
        if (bar == NA_INTEGER)
            error("result of function call was not finite");
        foo = bar;
    } else if (isLogical(result)) {
        int bar = LOGICAL(result)[0];
        foo = bar;
    }
    UNPROTECT(3);
    return foo;
}

