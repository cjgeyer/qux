/* Note:  the NEWS file for R-2.15.0 says
 *
 *    call_R and call_S are deprecated.  They still exist in the
 *    headers and as entry points, but are no longer documented and
 *    should not be used for new code.
 *
 * Hence DO NOT use this as an example for new code.  Only use it to
 * help decipher some OLD CODE that uses call_R or call_S.
*/
#include <R.h>
#include <Rmath.h>

void quacks(void *func, double *state, int *len, double *result, int *lenresin)
{
    int lenres = lenresin[0];
    void *arguments[1];
    char *modes[1];
    long lengths[1];
    char *names[1];
    char *values[1];

    arguments[0] = state;
    modes[0] = "double";
    lengths[0] = len[0];
    names[0] = "x";

    call_R(func, 1, arguments, modes, lengths, names, 1, values);

    double *foo = (double *) values[0];
    for (int i = 0; i < lenres; i++) {
        if (! R_finite(foo[i]))
            error("function returned vector with non-finite element");
        result[i] = foo[i];
    }
}
