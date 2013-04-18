
 library(qux)

 qux(function(x) sum(log2(x)), 1:5)

 try(qux(function(x) sum(log2(x)), 0:5))

