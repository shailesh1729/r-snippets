
Linear Equations
============================================================================

.. index:: linear equation

Solving a linear equation::

    > A <- matrix(1:4, nrow=2)
    > v <- c(1:2)
    > b <- A %*% v
    > A
         [,1] [,2]
    [1,]    1    3
    [2,]    2    4
    > v
    [1] 1 2
    > b
         [,1]
    [1,]    7
    [2,]   10
    > solve(A, b)
         [,1]
    [1,]    1
    [2,]    2

.. index:: matrix inverse

Computing the inverse of a matrix through solving the equation :math:`AX=I`::

    > A <- matrix(1:4, nrow=2)
    > solve(A)
         [,1] [,2]
    [1,]   -2  1.5
    [2,]    1 -0.5

.. index:: quadratic form

Computing the quadratic form :math:`x^T A^{-1} x`::

    > A <- matrix(1:4, nrow=2)
    > x <- c(2,3)
    > x %*% solve(A) %*% x
         [,1]
    [1,]  2.5
    > x %*% solve(A, x)
         [,1]
    [1,]  2.5

The second approach is much more efficient and reliable.
