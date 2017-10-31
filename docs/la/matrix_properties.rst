Matrix Properties
======================

.. index:: det, determinant

Determinant of a matrix::

    > det(matrix(c(1:4), nrow=2))
    [1] -2

.. index:: rank

The rank of a matrix can be found through its QR decomposition::

    > m <- matrix(c(1,2,3, 2,4,6, 3, 3, 3), nrow=3)
    > qr(m)$rank
    [1] 2
    > det(m)
    [1] 0

.. index:: trace

Trace of a square matrix::

    > A <- matrix(c(1, 2, -1, 3, -6, 9, -1, 2, 1), nrow=3)
    > A
         [,1] [,2] [,3]
    [1,]    1    3   -1
    [2,]    2   -6    2
    [3,]   -1    9    1
    > sum(diag(A))
    [1] -4

