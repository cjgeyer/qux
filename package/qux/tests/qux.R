
 library(qux)

 qux(log2, 1:5)

 try(qux(log2, 0:5))

 fred <- function(x, y) x / y

 qux(fred, 1:5, y = 1:5)

 try(qux(fred, 0:5, y = 0:5))

 y <- 1:5
 fred <- function(x) x / y
 qux(fred, 1:5)

 sally <- function(x) list(x, x^2)
 try(qux(sally, 1:5))

