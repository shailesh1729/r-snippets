Least Squares
====================

.. index:: least squares

The least squares problem :math:`y = A x + e`.

Computing the least squares (without an intercept term)::

	> A <- matrix(c(1, 2, -1, 3, -6, 9, -1, 2, 1), nrow=3)
	> x <- c(1,2,3)
	> y <- A %*% x
	> lsfit(A, y, intercept=FALSE)
	$coefficients
	X1 X2 X3 
	 1  2  3 

	$residuals
	[1] 0 0 0

	$intercept
	[1] FALSE

	$qr
	$qt
	[1]  9.797959 16.970563  6.928203

	$qr
	             X1         X2         X3
	[1,] -2.4494897  7.3484692 -0.8164966
	[2,]  0.8164966  8.4852814  0.0000000
	[3,] -0.4082483 -0.9120956  2.3094011

	$qraux
	[1] 1.408248 1.409978 2.309401

	$rank
	[1] 3

	$pivot
	[1] 1 2 3

	$tol
	[1] 1e-07

	attr(,"class")
	[1] "qr"
