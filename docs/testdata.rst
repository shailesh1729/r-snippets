Test Data
===================


Matrices
-------------------

General ::

	> matrix(c(1,1,1,3,0,2), nrow=3)
	     [,1] [,2]
	[1,]    1    3
	[2,]    1    0
	[3,]    1    2
	> matrix(c(0,7,2,0,5,1), nrow=3)
	     [,1] [,2]
	[1,]    0    0
	[2,]    7    5
	[3,]    2    1


Permutation matrices::

	> diag(3)[c(1,3,2), ]
	     [,1] [,2] [,3]
	[1,]    1    0    0
	[2,]    0    0    1
	[3,]    0    1    0
	> x <- c (3,4,1,2)
	> diag(length(x))[x, ]
	     [,1] [,2] [,3] [,4]
	[1,]    0    0    1    0
	[2,]    0    0    0    1
	[3,]    1    0    0    0
	[4,]    0    1    0    0

Orthogonal matrices::

	> diag(1,nrow=2)
	     [,1] [,2]
	[1,]    1    0
	[2,]    0    1
	> theta <- pi/4; matrix(c(cos(theta), sin(theta), -sin(theta), cos(theta)), nrow=2)
	          [,1]       [,2]
	[1,] 0.7071068 -0.7071068
	[2,] 0.7071068  0.7071068



Symmetric positive definite matrices::


	> A <- matrix(c(5,1,1,3),2,2)
	> A
	     [,1] [,2]
	[1,]    5    1
	[2,]    1    3
	> eigen(A)$values
	[1] 5.414214 2.585786	
	> A <- matrix(c(4, 12, -16, 12, 37, -43, -16, -43, 98), nrow=3)
	> A
	     [,1] [,2] [,3]
	[1,]    4   12  -16
	[2,]   12   37  -43
	[3,]  -16  -43   98
	> eigen(A)$values
	[1] 123.47723179  15.50396323   0.01880498


Upper triangular matrices:: 

	> A <- matrix(c(2, 0, 0, 6, 1, 0, -8, 5, 3), nrow=3)
	> A
	     [,1] [,2] [,3]
	[1,]    2    6   -8
	[2,]    0    1    5
	[3,]    0    0    3

