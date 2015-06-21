Demo R package.  Shows how to call R from C using either

* `.Call` to get to C from R and `eval` to call R from C

* `.C` to get to C from R and `call_R` to call R from C

Note the latter is deprecated since R-2.15.0 but still works
(at least for a while).

Also shows how to call R from Fortran (via C function pretending
to be Fortran subroutine).
