distance.l1 <- function(x,y){
  sum(abs(x-y))
}

distance.l2 <- function(x,y){
  sqrt(sum((abs(x - y))^2 ))
}

distance.linf <- function(x,y){
  max(abs(x - y))
}

distance.lp <- function(x, y, p){
  (sum((abs(x - y))^p))^(1/p)
}

distance.canberra <- function(x, y){
  a1 <-  abs(x - y)
  a2 <- abs(x) + abs(y)
  a3 = a1 / a2
  sum(a1 / a2, na.rm=T)
}

distance.binary <- function(x, y){
  x <- x != 0
  y <- y != 0
  a <- sum(x & y)
  b <- sum (x | y)
  1 - (a / b)
}
