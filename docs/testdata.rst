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

