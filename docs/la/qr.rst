
QR Decomposition
============================================================================

.. index:: qr, qr decomposition, Gram-Schmidt 

We split a matrix :math:`A` into a product 
:math:`A = QR` where :math:`Q` is a matrix with
unit norm orthogonal vectors and :math:`R` 
is an upper triangular matrix.

An example matrix::


    A <- matrix(c(1,2,3, 2,4,6, 3, 3, 3), nrow=3)


Computing the QR decomposition::

    > QR <- qr(A)

Rank of the matrix::

    > QR$rank
    [1] 2


.. index:: qr.Q

The :math:`Q` factor::

    > Q <- qr.Q(QR); Q
               [,1]       [,2]       [,3]
    [1,] -0.2672612  0.8728716  0.4082483
    [2,] -0.5345225  0.2182179 -0.8164966
    [3,] -0.8017837 -0.4364358  0.4082483


.. index:: qr.R

The :math:`R` factor::

    > R <- qr.R(QR); R
              [,1]      [,2]      [,3]
    [1,] -3.741657 -4.810702 -7.483315
    [2,]  0.000000  1.963961  0.000000
    [3,]  0.000000  0.000000  0.000000


.. index:: qr.X

We can reconstruct the matrix :math:`A` from its decomposition as follows::

    > qr.X(QR)
         [,1] [,2] [,3]
    [1,]    1    2    3
    [2,]    2    4    3
    [3,]    3    6    3


.. index:: qr.qy

A method is also available to compute :math:`Q y` for any vector :math:`y`::

    > qr.qy(QR, c(1,0, 0))
    [1] -0.2672612 -0.5345225 -0.8017837
    > qr.qy(QR, c(0,0, 1))
    [1]  0.4082483 -0.8164966  0.4082483
    > qr.qy(QR, c(0,1, 0))
    [1]  0.8728716  0.2182179 -0.4364358
    > qr.qy(QR, c(0,1, 1))
    [1]  1.28111985 -0.59827869 -0.02818749


.. index:: qr.qty

Another method is available to compute :math:`Q^T y` for any vector :math:`y`::

    > qr.qty(QR, c(1,0,0))
    [1] -0.2672612  0.8728716  0.4082483
    > qr.qty(QR, c(0,1,0))
    [1] -0.5345225  0.2182179 -0.8164966
    > qr.qty(QR, c(0,0,1))
    [1] -0.8017837 -0.4364358  0.4082483
    > qr.qty(QR, c(0,1,1))
    [1] -1.3363062 -0.2182179 -0.4082483

.. index:: is.qr

Checking whether an object is a QR decomposition of a matrix::

    > is.qr(A)
    [1] FALSE
    > is.qr(QR)
    [1] TRUE


.. rubric:: Solving a linear system of equations using the QR decomposition


Consider the linear system of equations :math:`y = A x` ::


    > A <- matrix(c(3, 2, -1, 2, -2, .5, -1, 4, -1), nrow=3); A
         [,1] [,2] [,3]
    [1,]    3  2.0   -1
    [2,]    2 -2.0    4
    [3,]   -1  0.5   -1
    > x <- c(1, -2, -2); x
    [1]  1 -2 -2
    > y <- A %*% x ; y
         [,1]
    [1,]    1
    [2,]   -2
    [3,]    0

Compute the QR decomposition of :math:`A` ::

    > QR <- qr(A)
    > Q <- qr.Q(QR)
    > R <- qr.R(QR)

Computing :math:`b = Q^T y`::

    > b <- crossprod(Q, y); b
               [,1]
    [1,]  0.2672612
    [2,]  2.1472519
    [3,] -0.5638092


This can also be achieved as follows::

    > qr.qty(QR, y)
               [,1]
    [1,]  0.2672612
    [2,]  2.1472519
    [3,] -0.5638092



.. index:: backsolve

Solving the upper triangular system :math:`R x = b`::

    > backsolve(R, b)
         [,1]
    [1,]    1
    [2,]   -2
    [3,]   -2

Solving the equation in a single step::

    > backsolve(R, crossprod(Q, y))
         [,1]
    [1,]    1
    [2,]   -2
    [3,]   -2


The process of solving a linear equation using a QR decomposition can be performed in a single function call too::

    > solve.qr(QR, y)
         [,1]
    [1,]    1
    [2,]   -2
    [3,]   -2

