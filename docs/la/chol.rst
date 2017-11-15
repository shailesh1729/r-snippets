Cholesky Decomposition
============================================================================

Let's choose a symmetric positive definite matrix::

    > A <- matrix(c(4, 12, -16, 12, 37, -43, -16, -43, 98), nrow=3)
    > A
         [,1] [,2] [,3]
    [1,]    4   12  -16
    [2,]   12   37  -43
    [3,]  -16  -43   98

Let's perform its Cholesky decomposition::

    > U <- chol(A)
    > U
         [,1] [,2] [,3]
    [1,]    2    6   -8
    [2,]    0    1    5
    [3,]    0    0    3

Let's verify the correctness of the decomposition::

    > t(U) %*% U
         [,1] [,2] [,3]
    [1,]    4   12  -16
    [2,]   12   37  -43
    [3,]  -16  -43   98

Alternative way::

    > crossprod(U)
         [,1] [,2] [,3]
    [1,]    4   12  -16
    [2,]   12   37  -43
    [3,]  -16  -43   98

