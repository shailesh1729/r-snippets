
Eigen Value Decomposition
============================================================================

.. index:: eigen value, eigen value decomposition, eigen vector
.. index:: characteristic value, characteristic value decomposition, characteristic vector

Eigen value decomposition::

    > A <- matrix(1:9, nrow=3)
    > A <- A + t(A)
    > eigen(A)
    eigen() decomposition
    $values
    [1]  3.291647e+01 -5.329071e-15 -2.916473e+00

    $vectors
               [,1]       [,2]       [,3]
    [1,] -0.3516251  0.4082483  0.8424328
    [2,] -0.5533562 -0.8164966  0.1647127
    [3,] -0.7550872  0.4082483 -0.5130074

Let us verify the decomposition::

    > A
         [,1] [,2] [,3]
    [1,]    2    6   10
    [2,]    6   10   14
    [3,]   10   14   18


    > e <- eigen(A)
    > lambda <- diag(e$values)
    > U <- e$vectors
    > U %*% lambda %*% t(U)
         [,1] [,2] [,3]
    [1,]    2    6   10
    [2,]    6   10   14
    [3,]   10   14   18

Computing only the eigen values::

    > eigen(A, only.values = TRUE)
    $values
    [1]  3.291647e+01 -1.787388e-15 -2.916473e+00

    $vectors
    NULL
