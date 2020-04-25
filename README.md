Demo R package.  Shows how to call R from C using either

* `.Call` to get to C from R and `eval` to call R from C

* `.C` to get to C from R and `call_R` to call R from C

Note the latter is deprecated since R-2.15.0 but still works
(at least for a while).

Also shows how to call R from Fortran (via C function pretending
to be Fortran subroutine).

This package when checked with

    R CMD build qux
    R CMD check qux_*.tar.gz --as-cran

generates complaints about registration of native routines.
If we actually wanted to make this a CRAN package (which of course we
don't because it is just a demo), we would need to do that.
See R package `fooRegister` in Github repo `foo`
(https://github.com/cjgeyer/foo) for how to do that.

