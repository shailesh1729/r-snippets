Core Data Types
==================




Vectors
-----------

.. index:: vector

Creating a vector (via concatenation)::

	> b = c(3,4,5, 8, 10)

.. index:: sequence 

Sequence of integers::

	> v = c(-3:4)
	> v <- -3:4

Concatenating multiple ranges::

	> v = c(1:4, 8:10)

.. index:: indexing

Accessing elements::

	> b[2]

Indexing is 1-based.

.. index:: step size

Creating a vector over a range with a step size::

	> v2  = seq(from=0, to=1, by=0.25)

This will include both 0 and 1. It will have 5 elements.


Colon has higher precedence::

	> 2*1:4
	[1] 2 4 6 8


Backward sequence::

	> 10:1
	 [1] 10  9  8  7  6  5  4  3  2  1


Sequence with a specified length from a start::

	> seq(from=1, by=.5, length=4)
	[1] 1.0 1.5 2.0 2.5

Sequence with a specified length from an end::

	> seq(to=1, by=.5, length=4)
	[1] -0.5  0.0  0.5  1.0

Computing the step size of a sequence automatically::

	> seq(from=4, to=-4, length=5)
	[1]  4  2  0 -2 -4

.. index:: sum, +

Summing two vectors::
	
	> v3 = v1 + v2

Summing elements of a vector::

	> s = sum(v1)


.. index:: cumsum

Cumulative sum::

	> x <- c(1,3, 2, -1, 4,-6)
	> cumsum(x)
	[1] 1 4 6 5 9 3

Product of all elements::

	> x <- c(1,3, 2, -1, 4,-6)
	> prod(x)
	[1] 144




Sorting::

	> sort(c(3,2,1))


Sub-vector::

	> v = c(1:10)
	> v = [1:4]

.. index:: names

Assigning names to vector entries::

	> x <- 1:4
	> names(x) <- c("a", "b", "c", "d")
	> x
	a b c d 
	1 2 3 4 
	> x["a"]
	a 
	1
	> x["e"]
	<NA> 
	  NA 

.. index:: empty

Empty vectors::

	> e <- numeric()
	> e
	numeric(0)
	> e <- character()
	> e
	character(0)
	> e <- complex()
	> e
	complex(0)
	> e <- logical()
	> e
	logical(0)

.. index:: resizing; vector, growing; vector

Increasing size of a vector::

	> e <- numeric()
	> e[3]
	[1] NA
	> e[3] <- 10
	> e[3]
	[1] 10
	> e
	[1] NA NA 10

.. index:: truncating

Truncating a vector::

	> x <- 1:10
	> x
	 [1]  1  2  3  4  5  6  7  8  9 10
	> x <- x[2:4]
	> x
	[1] 2 3 4

.. index:: reversing; vector

Reversing a vector::

	> rev(1:3)
	[1] 3 2 1

.. index:: head; vector

First few elements of a vector::

	> head(1:8, n=4)
	[1] 1 2 3 4

.. index:: tail; vector

Last few elements of a vector::

	> tail(1:8, n=4)
	[1] 5 6 7 8

.. index:: interleaving; vector

Interleaving two vectors::

	> x <- c(1,2,3)
	> y <- c(4,5,6)
	> z <- c(rbind(x,y))
	> 
	> z
	[1] 1 4 2 5 3 6


.. index:: dot product, inner product, %*%; vector

Inner product of two vectors::

	> c(1, 0, 1) %*% c(-1, 0, -1) 
	     [,1]
	[1,]   -2


.. index:: outer;vector, outer product; vector, %o%

Outer product of two vectors::

	> v1 <- 1:3
	> v2 <- 2:4
	> v1 %o% v2
	     [,1] [,2] [,3]
	[1,]    2    3    4
	[2,]    4    6    8
	[3,]    6    9   12
	> outer(v1,v2)
	     [,1] [,2] [,3]
	[1,]    2    3    4
	[2,]    4    6    8
	[3,]    6    9   12

Outer sum of two vectors::

	> outer(v1,v2, '+')
	     [,1] [,2] [,3]
	[1,]    3    4    5
	[2,]    4    5    6
	[3,]    5    6    7

Outer subtraction of two vectors::

	> outer(v1,v2, '-')
	     [,1] [,2] [,3]
	[1,]   -1   -2   -3
	[2,]    0   -1   -2
	[3,]    1    0   -1

Evaluating a 2-variable function f(x,y) over a grid of x and y values::

	> x <- seq(0, 1, by=0.5)
	> x
	[1] 0.0 0.5 1.0
	> y <- seq(0, 1, by=0.2)
	> f <- function(x, y) x*y /(x+y+1)
	> outer(x,y, f)
	     [,1]       [,2]      [,3]      [,4]      [,5]      [,6]
	[1,]    0 0.00000000 0.0000000 0.0000000 0.0000000 0.0000000
	[2,]    0 0.05882353 0.1052632 0.1428571 0.1739130 0.2000000
	[3,]    0 0.09090909 0.1666667 0.2307692 0.2857143 0.3333333


.. index:: multiplication table

Constructing the multiplication table::

	> outer(2:11, 1:10)
	      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
	 [1,]    2    4    6    8   10   12   14   16   18    20
	 [2,]    3    6    9   12   15   18   21   24   27    30
	 [3,]    4    8   12   16   20   24   28   32   36    40
	 [4,]    5   10   15   20   25   30   35   40   45    50
	 [5,]    6   12   18   24   30   36   42   48   54    60
	 [6,]    7   14   21   28   35   42   49   56   63    70
	 [7,]    8   16   24   32   40   48   56   64   72    80
	 [8,]    9   18   27   36   45   54   63   72   81    90
	 [9,]   10   20   30   40   50   60   70   80   90   100
	[10,]   11   22   33   44   55   66   77   88   99   110


.. index:: line vector

By default a vector is neither a row vector or 
a column vector. It is a line vector.

.. index:: row vector

Coercing a vector into a row vector::

	> v <- 1:3
	> v
	[1] 1 2 3
	> t(v)
	     [,1] [,2] [,3]
	[1,]    1    2    3




.. index:: column vector

Coercing into a column vector::
	> t(t(v))
	     [,1]
	[1,]    1
	[2,]    2
	[3,]    3

Alternative way::

	> dim(v) <- c(3,1)
	> v
	     [,1]
	[1,]    1
	[2,]    2
	[3,]    3
	> dim(v) <- c(1,3)
	> v
	     [,1] [,2] [,3]
	[1,]    1    2    3


Converting a vector into a row vector::

	> rbind(v)


Converting a vector into a column vector::

	> cbind(v)


.. index:: rep

Repeating a vector::

	> v <- 1:4
	> rep(v, 4)
	 [1] 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4


Controlling the final length::

	> rep(v, 4, length.out=10)
	 [1] 1 2 3 4 1 2 3 4 1 2

Repeating each element few times then repeating the whole sequence::

	> rep(v, times=3, each=2)
	 [1] 1 1 2 2 3 3 4 4 1 1 2 2 3 3 4 4 1 1 2 2 3 3 4 4

Separate repetition count for each element::

	> rep(v, c(1,2,3,4))
	 [1] 1 2 2 3 3 3 4 4 4 4

 

Index Vectors
''''''''''''''''''''''''''''''

.. index:: indexing

Logical index vectors::

	> x
	[1]   1   4  NA   5 NaN
	> is.na(x)
	[1] FALSE FALSE  TRUE FALSE  TRUE
	> y <- x[!is.na(x)]
	> y
	[1] 1 4 5


Integral index vectors::

	> x <- sample(1:10, 10)
	> x
	 [1]  4  1  3  7  9 10  5  2  8  6
	> x[c(1,4,7,10)]
	[1] 4 7 5 6
	> x[seq(1,10, 2)]
	[1] 4 3 9 5 8
	> x[c(1:4, 1:4)]
	[1] 4 1 3 7 4 1 3 7
	> paste(c("x","y")[rep(c(1,2,2,1), times=4)], collapse='')
	[1] "xyyxxyyxxyyxxyyx"

Excluding some indices::

	> x
	 [1]  8  4  3  7 10  5  9  6  2  1
	> x[-c(1,4,8:10)]
	[1]  4  3 10  5  9

Accessing vector entries by their names::

	> x <- 1:4
	> names(x) <- c("a", "b", "c", "d")
	> x[c("c", "b")]
	c b 
	3 2 



Matrices
--------------

.. index:: matrix

Creating a matrix by specifying rows::

	> m = matrix(c(1:12), nrow=3)
	> m
	     [,1] [,2] [,3] [,4]
	[1,]    1    4    7   10
	[2,]    2    5    8   11
	[3,]    3    6    9   12

The entries in matrix are read from the data vector in column major order.


Creating a matrix by specifying columns::

	> m = matrix(c(1:12), ncol=3)
	> m
	     [,1] [,2] [,3]
	[1,]    1    5    9
	[2,]    2    6   10
	[3,]    3    7   11
	[4,]    4    8   12

.. index:: accessing; matrix

Accessing an element::

	> m[1,1]
	[1] 1

Accessing first row::

	> m[1,]
	[1] 1 5 9

Accessing first column::

	> m[,1]
	[1] 1 2 3 4


Accessing first and second rows::

	> m[1:2,]
	     [,1] [,2] [,3]
	[1,]    1    5    9
	[2,]    2    6   10

Accessing a sub-matrix (1st 2 rows, last 2 columns)::

	> m[1:2, 2:3]
	     [,1] [,2]
	[1,]    5    9
	[2,]    6   10

.. index:: sum, rowSums, colSums


Computing the sum of all elements::

	> sum(m)
	[1] 78

Sum over each row::

	> rowSums(m)
	[1] 15 18 21 24

Sum over each column::

	> colSums(m)
	[1] 10 26 42


.. index:: mean, rowMeans, colMeans

Computing the mean of all elements::

	> mean(m)
	[1] 6.5


Mean over each row::

	> rowMeans(m)
	[1] 5 6 7 8

Mean over each column::

	> colMeans(m)
	[1]  2.5  6.5 10.5


.. index:: nrow, ncol, dim

Matrix dimensions::

	> m <- matrix(1:6, nrow=2)
	> nrow(m)
	[1] 2
	> ncol(m)
	[1] 3
	> dim(m)
	[1] 4 3


.. index:: cbind

Binding columns::

	> cbind(1:4, 2:5, 3:6, 4:7)
	     [,1] [,2] [,3] [,4]
	[1,]    1    2    3    4
	[2,]    2    3    4    5
	[3,]    3    4    5    6
	[4,]    4    5    6    7


.. index:: rbind


Binding rows::

	> rbind(1:4, 2:5, 3:6, 4:7)
	     [,1] [,2] [,3] [,4]
	[1,]    1    2    3    4
	[2,]    2    3    4    5
	[3,]    3    4    5    6
	[4,]    4    5    6    7

Series of row and column binds::

	> m <- cbind(1:4, 2:5)
	> m <- cbind(m, 3:6)
	> m <- rbind(m, 9:11)
	> m
	     [,1] [,2] [,3]
	[1,]    1    2    3
	[2,]    2    3    4
	[3,]    3    4    5
	[4,]    4    5    6
	[5,]    9   10   11


.. index:: zeros

An all zeros matrix::

	> matrix(0, 2,3)
	     [,1] [,2] [,3]
	[1,]    0    0    0
	[2,]    0    0    0

.. index::  ones

An all ones matrix::

	> matrix(1, 2,3)
	     [,1] [,2] [,3]
	[1,]    1    1    1
	[2,]    1    1    1

.. index::  eye, identity

An identity matrix::

	> diag(3)
	     [,1] [,2] [,3]
	[1,]    1    0    0
	[2,]    0    1    0
	[3,]    0    0    1

.. index:: diag, diagonal

Diagonal matrix::

	> diag(1:3)
	     [,1] [,2] [,3]
	[1,]    1    0    0
	[2,]    0    2    0
	[3,]    0    0    3
	> diag(c(3, 10, 11))
	     [,1] [,2] [,3]
	[1,]    3    0    0
	[2,]    0   10    0
	[3,]    0    0   11

Diagonal matrix with additional columns:: 

	> diag(c(3, 10, 11), ncol=5)
	     [,1] [,2] [,3] [,4] [,5]
	[1,]    3    0    0    0    0
	[2,]    0   10    0    0    0
	[3,]    0    0   11    0    0

Diagonal elements get repeated on additional rows::

	> diag(c(3, 10, 11), nrow=5)
	     [,1] [,2] [,3] [,4] [,5]
	[1,]    3    0    0    0    0
	[2,]    0   10    0    0    0
	[3,]    0    0   11    0    0
	[4,]    0    0    0    3    0
	[5,]    0    0    0    0   10

Extracting the diagonal elements of a matrix::

	> m <- matrix(1:6, nrow=2)
	> m
	     [,1] [,2] [,3]
	[1,]    1    3    5
	[2,]    2    4    6
	> diag(m)
	[1] 1 4

.. index:: transpose, t

Transpose of a matrix::

	> matrix(1:6, nrow=2)
	     [,1] [,2] [,3]
	[1,]    1    3    5
	[2,]    2    4    6
	> t(matrix(1:6, nrow=2))
	     [,1] [,2]
	[1,]    1    2
	[2,]    3    4
	[3,]    5    6

.. index:: matrix multiplication, %*%

Matrix multiplication::

	> m <- matrix(1:4, nrow=2)
	> m %*% m
	     [,1] [,2]
	[1,]    7   15
	[2,]   10   22


.. index:: quadratic form

Quadratic form::

	> v = c(1:2)
	> v %*% m %*% v
	     [,1]
	[1,]   27

Note that the vector v is being treated as both row vector and column vector.

.. index:: cross product; matrix

Cross product of two matrices::

	> A <- matrix(c(1,1,1,3,0,2), nrow=3)
	> B <- matrix(c(0,7,2,0,5,1), nrow=3)
	> A
	     [,1] [,2]
	[1,]    1    3
	[2,]    1    0
	[3,]    1    2
	> B
	     [,1] [,2]
	[1,]    0    0
	[2,]    7    5
	[3,]    2    1
	> t(A) %*% B
	     [,1] [,2]
	[1,]    9    6
	[2,]    4    2
	> crossprod(A, B)
	     [,1] [,2]
	[1,]    9    6
	[2,]    4    2
	> A %*% t(B)
	     [,1] [,2] [,3]
	[1,]    0   22    5
	[2,]    0    7    2
	[3,]    0   17    4
	> tcrossprod(A, B)
	     [,1] [,2] [,3]
	[1,]    0   22    5
	[2,]    0    7    2
	[3,]    0   17    4

.. index:: gram matrix

Computing the Gram matrix for a given matrix :math:`A^T A`::

	> A <- matrix(c(1,1,1,3,0,2), nrow=3)
	> t(A) %*% A
	     [,1] [,2]
	[1,]    3    5
	[2,]    5   13
	> crossprod(A)
	     [,1] [,2]
	[1,]    3    5
	[2,]    5   13


.. index:: frame operator

Computing the frame :math:`A A^T`::

	> A <- matrix(c(1,1,1,3,0,2), nrow=3)
	> A %*% t(A)
	     [,1] [,2] [,3]
	[1,]   10    1    7
	[2,]    1    1    1
	[3,]    7    1    5

.. index:: outer; matrix

Outer product of two matrices::

	> m1 <- matrix(1:4, nrow=2)
	> m2 <- matrix(c(1,3,5,7), nrow=2)
	> outer(m1, m2)
	, , 1, 1

	     [,1] [,2]
	[1,]    1    3
	[2,]    2    4

	, , 2, 1

	     [,1] [,2]
	[1,]    3    9
	[2,]    6   12

	, , 1, 2

	     [,1] [,2]
	[1,]    5   15
	[2,]   10   20

	, , 2, 2

	     [,1] [,2]
	[1,]    7   21
	[2,]   14   28

.. index:: rownames, colnames

Assigning names to rows and columns::

	> m <- matrix(c(1:4), nrow=2)
	> colnames(m) <- c("x", "y")
	> rownames(m) <- c("a", "b")
	> m
	  x y
	a 1 3
	b 2 4


Arrays
----------------

.. index:: array

Creating an array::

	> a <- array(1:10, dim=c(4,4,4))
	> a
	, , 1

	     [,1] [,2] [,3] [,4]
	[1,]    1    5    9    3
	[2,]    2    6   10    4
	[3,]    3    7    1    5
	[4,]    4    8    2    6

	, , 2

	     [,1] [,2] [,3] [,4]
	[1,]    7    1    5    9
	[2,]    8    2    6   10
	[3,]    9    3    7    1
	[4,]   10    4    8    2

	, , 3

	     [,1] [,2] [,3] [,4]
	[1,]    3    7    1    5
	[2,]    4    8    2    6
	[3,]    5    9    3    7
	[4,]    6   10    4    8

	, , 4

	     [,1] [,2] [,3] [,4]
	[1,]    9    3    7    1
	[2,]   10    4    8    2
	[3,]    1    5    9    3
	[4,]    2    6   10    4


Checking its dimensions::

	> dim(a)
	[1] 4 4 4


Accessing its elements::

	> a[1,1,1]
	[1] 1
	> a[1,2, 1:4]
	[1] 5 1 7 3
	> 


Creating an array from a vector::

	> x <- 1:18
	> dim(x) <- c(2,3,3)
	> x
	, , 1

	     [,1] [,2] [,3]
	[1,]    1    3    5
	[2,]    2    4    6

	, , 2

	     [,1] [,2] [,3]
	[1,]    7    9   11
	[2,]    8   10   12

	, , 3

	     [,1] [,2] [,3]
	[1,]   13   15   17
	[2,]   14   16   18


.. index:: recycling; array

Recycling of vector elements while constructing of an array::

	> a <- array(1:4, dim=c(2,3,3))
	> a
	, , 1

	     [,1] [,2] [,3]
	[1,]    1    3    1
	[2,]    2    4    2

	, , 2

	     [,1] [,2] [,3]
	[1,]    3    1    3
	[2,]    4    2    4

	, , 3

	     [,1] [,2] [,3]
	[1,]    1    3    1
	[2,]    2    4    2


.. index:: generalized transpose, aperm

Generalized transpose of an array::

	> a <- array(1:4, dim=c(2,3,4))
	> b <- aperm(a, perm=c(3,2, 1))
	> dim(b)
	[1] 4 3 2

The usual transpose of a matrix is a special case 

Index Matrices
''''''''''''''''''''''''''''''

.. index:: index matrix; array

Using an index matrix to pick out elements from an array::

	> data <- array(1:20, dim=c(5,4))
	> data
	     [,1] [,2] [,3] [,4]
	[1,]    1    6   11   16
	[2,]    2    7   12   17
	[3,]    3    8   13   18
	[4,]    4    9   14   19
	[5,]    5   10   15   20
	> indices <- cbind(c(1,2,3), c(1,3,2))
	> indices
	     [,1] [,2]
	[1,]    1    1
	[2,]    2    3
	[3,]    3    2
	> data[indices]
	[1]  1 12  8


Each row in the index matrix identifies one element in the data array to be picked.
The number of columns in the index matrix must be same as the dimension of the data array.

Updating array elements using the index matrix::

	> data[indices] <- 0
	> data
	     [,1] [,2] [,3] [,4]
	[1,]    0    6   11   16
	[2,]    2    7    0   17
	[3,]    3    0   13   18
	[4,]    4    9   14   19
	[5,]    5   10   15   20


Indices with NA and 0::

	> indices <- cbind(c(1,2,3, NA, 2), c(2,3,4, 2, 0))
	> data[indices]
	[1]  6  0 18 NA

Rows containing NA return NA. Rows containing 0 are ignored.

.. index:: anti-diagonal

Extracting the elements of the anti-diagonal from a matrix::


	> m <- matrix(1:9, nrow=3)
	> m
	     [,1] [,2] [,3]
	[1,]    1    4    7
	[2,]    2    5    8
	[3,]    3    6    9
	> indices = cbind(1:3, rev(1:3))
	> indices
	     [,1] [,2]
	[1,]    1    3
	[2,]    2    2
	[3,]    3    1
	> m[indices]
	[1] 7 5 3

A matrix with 0 everywhere and 1 in the anti-diagonal::

	> m <- matrix(0, 3,3)
	> m[indices] = 1
	> m
	     [,1] [,2] [,3]
	[1,]    0    0    1
	[2,]    0    1    0
	[3,]    1    0    0

This is also known as anti-diagonal matrix.

The recycling rule
''''''''''''''''''''''''

* The expression is scanned from left to right.
* Any short vector operands are extended by recycling their values until they match the size of any other operands.
* As long as short vectors and arrays only are encountered, the arrays must all have the same dim attribute or an error results.
* Any vector operand longer than a matrix or array operand generates an error.
* If array structures are present and no error or coercion to vector has been precipitated, the result is an array structure with the common dim attribute of its array operands.





Lists
------------


.. index:: list

Creating a list::

	> l = list(a=c(1,2,3), b=c(1:10), c=3)
	> l
	$a
	[1] 1 2 3

	$b
	 [1]  1  2  3  4  5  6  7  8  9 10

	$c
	[1] 3

	> l$a
	[1] 1 2 3
	> l$b
	 [1]  1  2  3  4  5  6  7  8  9 10
	> l$c
	[1] 3

.. index:: names; list

Names in the list::

	> names(l)
	[1] "a" "b" "c"

.. index:: [[]]; list, $ ; list

Accessing list elements::

	> l[[1]]
	[1] 1 2 3
	> l[[2]]
	 [1]  1  2  3  4  5  6  7  8  9 10
	> l[[3]]
	[1] 3
	> l$a
	[1] 1 2 3
	> l$c
	[1] 3
	> l$c + 2
	[1] 5
	> l$b + 3
	 [1]  4  5  6  7  8  9 10 11 12 13
	> l$a * l$a
	[1] 1 4 9
	> l[['a']]
	[1] 1 2 3
	> l[['b']]
	 [1]  1  2  3  4  5  6  7  8  9 10
	> l[['c']]
	[1] 3



``[]`` returns a sublist while ``[[]]`` returns
a list element::

	> l[1]
	$a
	[1] 1 2 3

	> l[c(1,2)]
	$a
	[1] 1 2 3

	$b
	 [1]  1  2  3  4  5  6  7  8  9 10



Iterating over list elements::

	> for (name in names(l)){print(l[[name]])}
	[1] 1 2 3
	 [1]  1  2  3  4  5  6  7  8  9 10
	[1] 3

.. index:: append; list

Appending elements in list::

	> for (name in names(l)){print(c(name,":", l[[name]]), quote=FALSE)}
	[1] a : 1 2 3
	 [1] b  :  1  2  3  4  5  6  7  8  9  10
	[1] c : 3
	[1] d : 4
	[1] e : 5

.. index:: remove; list

Removing the last element::

	> l[length(l)] <- NULL
	> length(l)
	[1] 4
	> for (name in names(l)){print(c(name,":", l[[name]]), quote=FALSE)}
	[1] a : 1 2 3
	 [1] b  :  1  2  3  4  5  6  7  8  9  10
	[1] c : 3
	[1] d : 4


Removing an intermediate element from list::

	> l[['c']] <- NULL
	> names(l)
	[1] "a" "b" "d"
	> for (name in names(l)){print(c(name,":", l[[name]]), quote=FALSE)}
	[1] a : 1 2 3
	 [1] b  :  1  2  3  4  5  6  7  8  9  10
	[1] d : 4
	> length(l)
	[1] 3


Creating lists without names::

	> l2 <- list(1,2,"hello")
	> l2
	[[1]]
	[1] 1

	[[2]]
	[1] 2

	[[3]]
	[1] "hello"

	> names(l2) <- c("x", "y", "z")
	> l2
	$x
	[1] 1

	$y
	[1] 2

	$z
	[1] "hello"

.. index:: c; list, concatenate; list

Concatenating two lists::

	> c(l, l2)
	$a
	[1] 1 2 3

	$b
	 [1]  1  2  3  4  5  6  7  8  9 10

	$c
	[1] 3

	$x
	[1] 1

	$y
	[1] 2

	$z
	[1] "hello"


.. index:: unlist

From list to vector::

	> l <- list (a=1, b=2, c=4)
	> unlist(l)
	a b c 
	1 2 4 
	> names(unlist(l))
	[1] "a" "b" "c"



Factors
--------------------------

.. index:: factor

Factoring a vector of numeric values::

	>  v <- c(1, 1, 2, 2, 2, 3, 3, 3, 3, 4, 4)
	> vf <- factor(v)
	> levels(vf)
	[1] "1" "2" "3" "4"
	> vf
	 [1] 1 1 2 2 2 3 3 3 3 4 4
	Levels: 1 2 3 4

.. index:: ordered factor

Constructing ordered factors::

	> vf <- factor(v, levels=c(1,2,3,4), ordered=TRUE)
	> vf
	 [1] 1 1 2 2 2 3 3 3 3 4 4
	Levels: 1 < 2 < 3 < 4

Converting the factors back to numeric values
to compute the mean::

	> mean(as.numeric(levels(vf)[vf]))
	[1] 2.545455


Factoring a vector of strings::

	> colors <- sample(c("red", "green", "blue"), 10, replace = TRUE)
	> colors <- factor(colors)
	> colors
	 [1] blue  green green blue  green blue  red   red   blue  red  
	Levels: blue green red
	> levels(colors)
	[1] "blue"  "green" "red"  


Using factors for grouping to compute the mean::

	> colors <- c('r', 'r', 'g', 'b', 'r', 'g', 'g', 'b', 'b', 'r')
	> length(colors)
	[1] 10
	> lengths <-c(1, 1, 2, 2, 1, 1, 1, 2, 2, 3)
	> length(lengths)
	[1] 10
	> colorsf <- factor(colors)
	> mean(lengths)
	[1] 1.6
	> tapply(lengths, colorsf, mean)
	       b        g        r 
	2.000000 1.333333 1.500000 

.. index:: gl, generate levels

Generating a sequence of factors::

	> gl(2,8)
	 [1] 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2
	Levels: 1 2
	> as.integer(gl(2,8))
	 [1] 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2


Generating factors with labels::

	> gl(2,8, labels=c("x", "y"))
	 [1] x x x x x x x x y y y y y y y y
	Levels: x y
	> as.integer(gl(2,8, labels=c("x", "y")))
	 [1] 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2


By default the generated factors are unordered.

Generating ordered factors::

	> gl(2,8, labels=c("c", "b"), ordered=TRUE)
	 [1] c c c c c c c c b b b b b b b b
	Levels: c < b


We can use the length argument to repeat the sequence::

	> gl(2,1,10)
	 [1] 1 2 1 2 1 2 1 2 1 2
	Levels: 1 2
	> gl(2,2,10)
	 [1] 1 1 2 2 1 1 2 2 1 1
	Levels: 1 2
	> gl(2,2,12)
	 [1] 1 1 2 2 1 1 2 2 1 1 2 2
	Levels: 1 2
	> gl(2,3,12)
	 [1] 1 1 1 2 2 2 1 1 1 2 2 2
	Levels: 1 2



Data Frames
----------------

.. index:: data frame, data.frame

Creating a data frame::

	> t = data.frame(x=c(11,12,13), y=c(21,22,23), z=c(7,20, 10))
	   x  y  z
	1 11 21  7
	2 12 22 20
	3 13 23 10

Accessing first row::

	> t[1,]
	   x  y z
	1 11 21 7

.. index:: $; data frame

Accessing named columns::

	> t$x
	[1] 11 12 13
	> t$y
	[1] 21 22 23


Accessing columns by number::

	> t[,1]
	[1] 11 12 13

Another example::

	> hw = data.frame(hello=c(1,2,3), world=c(4,5,6))
	> hw
	  hello world
	1     1     4
	2     2     5
	3     3     6

.. index:: rowSums; data frame, colSums; data frame

Summing each column::

	> colSums(t)
	 x  y  z 
	36 66 37

Summing each row::

	> rowSums(t)
	[1] 39 54 46


.. index:: as.data.frame

Data frame from a list::

	> l <- list(x=c(1,2,3), y=c(3,2,1))
	> df <- as.data.frame((l))
	> df
	  x y
	1 1 3
	2 2 2
	3 3 1

.. index:: attach, detach

Attaching workspace to columns of data frame::

	> df <- data.frame(x=c(1,2,3), y=c(3,2,1))
	> x
	Error: object 'x' not found
	> attach(df)
	> x
	[1] 1 2 3
	> y
	[1] 3 2 1
	> detach(df)
	> x
	Error: object 'x' not found


Updating the data frame through attached variables::

	> attach(df)
	> df.x <- x +  y
	> df
	  x y
	1 1 3
	2 2 2
	3 3 1
	> df$x <- x +  y
	> df
	  x y
	1 4 3
	2 4 2
	3 4 1
	> x
	[1] 1 2 3
	> y
	[1] 3 2 1
	> detach()
	> attach(df)
	> x
	[1] 4 4 4
	> y
	[1] 3 2 1



Time Series
--------------------------------

Creating a time series from an observation vector::

	> observations <- sample(1:10, 24, replace=T)
	> observations
	 [1]  2  7  2  6  2  5  5  8  8  6  4  9  8  6  3  2  5  1  2  5  4  8  5 10
	> time_series <- ts(observations, start=c(2016,1), frequency=12)
	> time_series
	     Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
	2016   2   7   2   6   2   5   5   8   8   6   4   9
	2017   8   6   3   2   5   1   2   5   4   8   5  10

Some properties of time series::

	> class(time_series)
	[1] "ts"
	> mode(time_series)
	[1] "numeric"
	> typeof(time_series)
	[1] "integer"


Extracting a window from the time series::

	> window(time_series, start=c(2016, 7), end=c(2016, 12))
	     Jul Aug Sep Oct Nov Dec
	2016   5   8   8   6   4   9
