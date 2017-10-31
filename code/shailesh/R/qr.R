mgs <- function(X){

  # Ensure that X is a matrix
  X <- as.matrix(X)
  # Number of rows
  m <- nrow(X)
  # Number of columns
  n <- ncol(X)
  if (m < n) {
    stop('Wide matrices are not supported.')
  }
  # Construct the empty Q and R matrices
  Q <- matrix(0, m, n)
  R <- matrix(0, n, n)
  for (j in 1:n){
    # Pick up the j-th column of X
    v <- X[, j]
    # compute the projection of v on existing columns
    if (j > 1){
      for (i in 1:(j-1)){
        # pick up the i-th Q vector
        q <- Q[, i]
        #cat('q: '); print(q)
        # compute projection of v on qi
        projection <- as.vector(q %*% v)
        #cat('projection: '); print(projection)
        # Store the projection in R
        R[i, j] <- projection
        # subtract the projection from v
        v <- v - projection * q
      }
    }
    # cat('v: ') ; print(v)
    # Compute the norm of the remaining vector
    v.norm <- sqrt(sum(v^2))
    # cat('v-norm: '); print(v.norm)
    # Store the norm in R
    R[j,j] <- v.norm
    # Place the normalized vector in Q
    Q[, j] <- v / v.norm
  }
  # Prepare the result
  result <- list(Q=Q, R=R, call=match.call())
  # Set the class of the result
  class(result) <- 'mgs'
  result
}

mgs.q <- function(mgs){
  mgs$Q
}

mgs.r <- function(mgs){
  mgs$R
}

mgs.x <- function(mgs){
  mgs$Q %*% mgs$R
}


print.mgs <- function(mgs){
  cat("Call: \n")
  print(mgs$call)
  cat('Q: \n')
  print(mgs$Q)
  cat('R: \n')
  print(mgs$R)
}
