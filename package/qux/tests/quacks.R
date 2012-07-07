
 library(qux)

 quacks(log2, 1:5, 5)

 try(quacks(log2, 0:5, 6))

 fred <- function(x, y) x / y

 quacks(fred, 1:5, 5, y = 1:5)

 try(quacks(fred, 0:5, 6, y = 0:5))

 y <- 1:5
 fred <- function(x) x / y
 quacks(fred, 1:5, 5)

 sally <- function(x) list(x, x^2)
 try(quacks(sally, 1:5, 10))

