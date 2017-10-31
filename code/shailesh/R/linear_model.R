linear.model <- function(X, y){
  # Compute the QR decomposition of X
  X.qr <- qr(X)
  ## Estimate the coefficients using the QR decomposition
  coeffs <- solve.qr(X.qr, y)
  # Estimates
  y.est <- X %*% coeffs
  # Residuals
  r <- y - y.est
  # Sum of squared residuals
  ssr <- sum(r^2)
  # Degrees of freedom
  df <- nrow(X) - ncol(X)
  # Standard deviation of result
  r.sigma.sq <- ssr/df
  r.sigma <- sqrt(r.sigma.sq)
  # return the result
  list(coefficients=coeffs,
       sigma=r.sigma,
       df=df)
}
