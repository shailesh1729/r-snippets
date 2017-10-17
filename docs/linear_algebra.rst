Linear Algebra
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



Linear Equations
---------------------------

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

Eigen Value Decomposition
--------------------------------

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


Singular Value Decomposition
----------------------------------

.. index:: svd, singular value decomposition, singular value 

SVD (Singular Value Decomposition) stands for 
splitting a matrix :math:`A` into a product
:math:`A = U S V^H` where :math:`U` and
:math:`V` are unitary matrices and :math:`S`
is a diagonal matrix consisting of singular
values on its main diagonal arranged in non-increasing
order where all the singular values are non-negative.

Computing the singular value decomposition of a matrix::

	> A <- matrix(c(1, 2, -1, 3, -6, 9, -1, 2, 1), nrow=3)
	> svd(A)
	$d
	[1] 11.355933  2.475195  1.707690

	$u
	           [,1]       [,2]       [,3]
	[1,]  0.2526715 -0.1073216 -0.9615816
	[2,] -0.5565826  0.7968092 -0.2351827
	[3,]  0.7914373  0.5946235  0.1415976

	$v
	            [,1]      [,2]       [,3]
	[1,] -0.14546854 0.3602437 -0.9214464
	[2,]  0.98806904 0.1005140 -0.1166899
	[3,] -0.05058143 0.9274273  0.3705672

Largest singular value::

	svd(A)$d[1]

Smallest singular value::

	> tail(svd(A)$d, n=1)
	[1] 1.70769



Absolute value of determinant as product of singular values::

	> det(A)
	[1] -48
	> prod(svd(A)$d)
	[1] 48


QR Decomposition
----------------------

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

The Q factor::

	> Q <- qr.Q(QR); Q
	           [,1]       [,2]       [,3]
	[1,] -0.2672612  0.8728716  0.4082483
	[2,] -0.5345225  0.2182179 -0.8164966
	[3,] -0.8017837 -0.4364358  0.4082483


The R factor::

	> R <- qr.R(QR); R
	          [,1]      [,2]      [,3]
	[1,] -3.741657 -4.810702 -7.483315
	[2,]  0.000000  1.963961  0.000000
	[3,]  0.000000  0.000000  0.000000


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


Cholesky Decomposition
-------------------------------

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

