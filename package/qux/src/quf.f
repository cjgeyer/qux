
      subroutine exercise(x, n, res)

      integer n
      double precision x(n)
      double precision res

      double precision doit
      external doit

      res = doit(x, n)

      end

