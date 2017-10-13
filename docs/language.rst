Language Facilities
======================


Flow Control
----------------------
.. index:: flow control

Help about control flow::

	?Control


.. index:: if

if ::

	> if (T) c(1,2)
	[1] 1 2
	> if (F) c(1,2)


if else::

	> if (T)  c(1,2,3) else matrix(c(1,2,3, 4), nrow=2)
	[1] 1 2 3
	> if (F)  c(1,2,3) else matrix(c(1,2,3, 4), nrow=2)
	     [,1] [,2]
	[1,]    1    3
	[2,]    2    4

.. index:: ifelse

vectorized ifelse::

	> v1 <- c(1,2,3,4)
	> v2 <- c(5,6,7,8)
	> cond <- c(T,F,F,T)
	> ifelse(cond, v1, v2)
	[1] 1 6 7 4


.. index:: &&, ||

Logical operations::

	> T && F
	[1] FALSE
	> T || F
	[1] TRUE

Element wise logical operations::

	> v1 <- c(T,T,F,F)
	> v2 <- c(T, F, T, F)
	> v1 | v2
	[1]  TRUE  TRUE  TRUE FALSE
	> v1 & v2
	[1]  TRUE FALSE FALSE FALSE

.. index:: for

For loop::

	ul <- rnorm(30)
	usq <- 0
	for (i in 1:10){
		usq <- ul[i] * ul[i]
	}

.. index:: nested for

Nested for loops::

	nrow <- 10
	ncol <- 10
	m <- matrix(nrow=nrow, ncol=ncol)

	for (i in 1:nrow){
		for (j in 1:ncol){
			m[i, j] <- i + j
		}
	}

.. index:: while

While loop::

	> i <- 10; while ( i < 20 ) {i <- i +1; print(i)}
	[1] 11
	[1] 12
	[1] 13
	[1] 14
	[1] 15
	[1] 16
	[1] 17
	[1] 18
	[1] 19
	[1] 20


Functions
--------------
.. index:: function

Calling an function::

	> b = c(2,3,5)
	> m = mean(x=b)
	> s = sum(c(4,5,8,11))


Computing variance by combining multiple functions::

	> x <- c(rnorm(10000))
	> sum((x-mean(x))^2)/(length(x)-1)
	[1] 0.992163



Defining a function::

	function (arglist){
		body
	}



Packages
----------------

.. index:: library

List of installed packages::

	> library()


.. index:: package installation

Installing a package::

	> install.packages("geometry")

Loading a package::

	> library("geometry")



R Scripts
---------------------

.. index:: scripts

Extension is ".R".

Running a script::

	> source("foo.R")



Logical Tests
-------------------

.. index:: is.na

Checking for missing values::

	> x <- c(1, 4, NA, 5, 0/0)
	> is.na(x)
	[1] FALSE FALSE  TRUE FALSE  TRUE


.. index:: is.nan

Checking for not a number values::

	> is.nan(x)
	[1] FALSE FALSE FALSE FALSE  TRUE

.. index:: is.vector

Checking for vectors::

	> is.vector(1:3)
	[1] TRUE
	> is.vector("133")
	[1] TRUE
	> is.vector(matrix(1:4, nrow=2))
	[1] FALSE

.. index:: matrix

Checking for matrices::

	> is.matrix(1:3)
	[1] FALSE
	> is.matrix(matrix(1:4, nrow=2))
	[1] TRUE


Introspection
---------------------

.. index:: mode, class, typeof

The mode of an object is the basic 
type of its fundamental constituents::

	> x <- 1:10
	> mode(x)
	[1] "numeric"

Class of an object::
	> class(x)
	[1] "integer"

Type of an object::
	> typeof(x)
	[1] "integer"

Length of an object::	
	> length(x)
	[1] 10

Mode of a list::

	> l <- list(1, '2', 3.4, TRUE)
	> mode(l)
	[1] "list"

Mode of a  sublist is also list::

	> mode(l[1])
	[1] "list"

But individual elements in the list have 
different modes::

	> mode(l[[1]])
	[1] "numeric"
	> mode(l[[2]])
	[1] "character"

.. index:: attributes, attr 

List of attributes ::

	> l <- list("1", 2, TRUE, NA)
	> attributes(l)
	NULL

Setting an attribute::

	> attr(l, 'color') <- 'red'
	> attributes(l)
	$color
	[1] "red"

	> attr(l, 'color')
	[1] "red"


The class of an object enables
object oriented programming
and allows same function
to behave differently 
for different classes.

Querying the class of an object::

	> class(1:10)
	[1] "integer"
	> class(matrix(1:10, nrow=2))
	[1] "matrix"
	> class(list(1,2,3))
	[1] "list"

.. index:: unclass


Removing the class of an object (temporarily)::

	> unclass(object)

Coercion 
----------------------

.. index:: coercion, type conversion

.. index:: as.character

Integers to strings::

	> as.character(10:14)
	[1] "10" "11" "12" "13" "14"

.. index:: as.integer

Strings to integers::

	> as.integer(c("10", "11", "12", "13"))
	[1] 10 11 12 13


.. index:: as.vector

Convert an array to a vector::

	> as.vector(arr)


Sorting and Searching
---------------------------------

.. index:: searching, which

Searching in a vector::

	> which (v == 5)
	[1] 5
	> which (v > 5)
	[1]  6  7  8  9 10
	> which (v > 5 & v < 8)
	[1] 6 7

Searching in a matrix::

	> m <- matrix(1:10, nrow=2)
	> m == 4
	      [,1]  [,2]  [,3]  [,4]  [,5]
	[1,] FALSE FALSE FALSE FALSE FALSE
	[2,] FALSE  TRUE FALSE FALSE FALSE
	> which(m == 4)
	[1] 4




.. index:: sorting, sort

Sorting a vector in ascending order::

	> x = sample(1:10)
	> x
	 [1]  6  5  8 10  2  4  1  3  7  9
	> sort(x)
	 [1]  1  2  3  4  5  6  7  8  9 10


.. index:: unique

Finding unique elements::

	> v <- c(1, 4, 4, 3, 4, 4, 3, 3, 1, 2, 3, 4, 2, 3, 1, 3, 5, 6)
	> unique(v)
	[1] 1 4 3 2 5 6



Basic Mathematical Functions
-------------------------------

.. index:: sin, cos, tan, asin, acos, atan, trigonometry 

Trigonometric functions::

	> theta = pi/2
	> sin(theta)
	[1] 1
	> cos(theta)
	[1] 6.123032e-17
	> tan(theta)
	[1] 1.633124e+16
	> asin(1)
	[1] 1.570796
	> acos(1)
	[1] 0
	> atan(1)
	[1] 0.7853982
	> atan(1) * 2
	[1] 1.570796

.. index:: exp, exponentiation

Exponentiation::

	> exp(1)
	[1] 2.718282


.. index:: logarithm, ln, log, log10, log2

Logarithms::

	> log(exp(1))
	[1] 1
	> log(exp(4))
	[1] 4
	> log10(10^4)
	[1] 4
	> log2(8)
	[1] 3
	> log2(c(8,16,256,1024, 2048))
	[1]  3  4  8 10 11

.. index:: sqrt, square root

Square root::

	> sqrt(4)
	[1] 2
	> sqrt(-4)
	[1] NaN
	Warning message:
	In sqrt(-4) : NaNs produced
	> sqrt(-4+0i)
	[1] 0+2i




Built-in Constants
-------------------

.. index:: pi

:math:`\pi`::

> pi
[1] 3.141593
> 


.. index:: months

Month names::

	> month.name
	 [1] "January"   "February"  "March"     "April"     "May"       "June"      "July"      "August"   
	 [9] "September" "October"   "November"  "December" 

Month name abbreviations::


	> month.abb
	 [1] "Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec"


.. index:: letters

English letters::

	> letters
	 [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
	> LETTERS
	 [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"


Converting Numerical Data to Factor
--------------------------------------------

.. index:: cut, binning

Numerical data may need to be binned into a sequence of intervals.


Breaking data into intervals of equal length::

	> data <- sample(0:20, 10, replace = TRUE)
	> data
	 [1] 10  0 20  3 13 13 16  2  1 10
	> cut (data, breaks=4)
	 [1] (5,10]    (-0.02,5] (15,20]   (-0.02,5] (10,15]   (10,15]   (15,20]   (-0.02,5] (-0.02,5] (5,10]   
	Levels: (-0.02,5] (5,10] (10,15] (15,20]


Each interval is by default open on left side and closed on right side.
Closed on left and open on right intervals can be created by
using the parameter right=FALSE.

Frequency of categories::

	> table(cut (data, breaks=4))

	(-0.02,5]    (5,10]   (10,15]   (15,20] 
	        4         2         2         2 


Making sure that the factors are ordered::

	> cut (data, breaks=4, ordered_result = TRUE)
	 [1] (5,10]    (-0.02,5] (15,20]   (-0.02,5] (10,15]   (10,15]   (15,20]   (-0.02,5] (-0.02,5] (5,10]   
	Levels: (-0.02,5] < (5,10] < (10,15] < (15,20]


Using our own labels for the factors::

	> cut (data, breaks=4, labels=c("a", "b", "c", "d"))
	 [1] b a d a c c d a a b
	Levels: a b c d

Specifying our own break-points (intervals) for cutting::

	> cut (data, breaks=c(-1, 5,10, 20))
	 [1] (5,10]  (-1,5]  (10,20] (-1,5]  (10,20] (10,20] (10,20] (-1,5]  (-1,5]  (5,10] 
	Levels: (-1,5] (5,10] (10,20]

Including the lowest value in the first interval::

	> cut (data, breaks=c(0, 5,10, 20), include.lowest = TRUE)
	 [1] (5,10]  [0,5]   (10,20] [0,5]   (10,20] (10,20] (10,20] [0,5]   [0,5]   (5,10] 
	Levels: [0,5] (5,10] (10,20]



Apply Family of Functions
------------------------------------

.. index:: apply

Sample data::

	> m <- matrix(1:8, nrow=2)
	> m
	     [,1] [,2] [,3] [,4]
	[1,]    1    3    5    7
	[2,]    2    4    6    8


Summing  a matrix over rows::

	> apply(m, 1, sum)
	[1] 16 20

Summing a matrix over columns::

	> apply(m, 2, sum)
	[1]  3  7 11 15


Median for each row and column::

	> apply(m, 1, median)
	[1] 4 5
	> apply(m, 2, median)
	[1] 1.5 3.5 5.5 7.5


.. index:: lapply, [

``lapply``  applies a function on each
element of a list and returns the values
as a list.

Let's prepare a list of matrices::

	> A <- matrix(c(1,1,1,3,0,2), nrow=3)
	> B <- matrix(c(0,7,2,0,5,1), nrow=3)
	> l <- list(A, B)
	> l
	[[1]]
	     [,1] [,2]
	[1,]    1    3
	[2,]    1    0
	[3,]    1    2

	[[2]]
	     [,1] [,2]
	[1,]    0    0
	[2,]    7    5
	[3,]    2    1


Extracting first row from each matrix::

	> lapply(l, '[', 1,)
	[[1]]
	[1] 1 3

	[[2]]
	[1] 0 0

Extracting second column from each matrix::

	> lapply(l, '[', , 2)
	[[1]]
	[1] 3 0 2

	[[2]]
	[1] 0 5 1


Extracting the element at position [1,2] from each matrix::

	> lapply(l, '[', 1,2)
	[[1]]
	[1] 3

	[[2]]
	[1] 0
	> unlist(lapply(l, '[', 1,2))
	[1] 3 0



Computing the mean of each column in the mtcars dataset::

	> lapply(mtcars, 'mean')
	$mpg
	[1] 20.09062

	$cyl
	[1] 6.1875

	$disp
	[1] 230.7219

	$hp
	[1] 146.6875

	$drat
	[1] 3.596563

	$wt
	[1] 3.21725

	$qsec
	[1] 17.84875

	$vs
	[1] 0.4375

	$am
	[1] 0.40625

	$gear
	[1] 3.6875

	$carb
	[1] 2.8125



.. index:: sapply

``sapply`` can help achieve the combination of unlist and lapply
easily::

	> sapply(l, '[', 1,2)
	[1] 3 0

It basically attempts to simplify the result of ``lapply``
as much as possible.

Computing the mean of each column in mtcars::

	> sapply(mtcars, 'mean')
	       mpg        cyl       disp         hp       drat         wt       qsec         vs         am 
	 20.090625   6.187500 230.721875 146.687500   3.596563   3.217250  17.848750   0.437500   0.406250 
	      gear       carb 
	  3.687500   2.812500 

The same for iris dataset::

	> sapply(iris, 'mean')
	Sepal.Length  Sepal.Width Petal.Length  Petal.Width      Species 
	    5.843333     3.057333     3.758000     1.199333           NA 
	Warning message:
	In mean.default(X[[i]], ...) :
	  argument is not numeric or logical: returning NA


Printing class of each column in a data frame::

	> sapply(iris, class)
	Sepal.Length  Sepal.Width Petal.Length  Petal.Width      Species 
	   "numeric"    "numeric"    "numeric"    "numeric"     "factor" 


.. index:: mapply

``mapply`` applies a function repetitively to elements
from a pair of lists or vectors::

	> v1 <- c(1,2,3)
	> v2 <- c(3,4,5)
	> mapply(v1, v2, sum)
	[1] 4 6 8


Applying ``rep`` to each element of a vector
and constructing a matrix of repeated rows::

	> mapply(rep,1:4,4)
	     [,1] [,2] [,3] [,4]
	[1,]    1    2    3    4
	[2,]    1    2    3    4
	[3,]    1    2    3    4
	[4,]    1    2    3    4


This is equivalent to::

	> matrix(c(rep(1, 4), rep(2, 4), rep(3, 4), rep(4, 4)),4,4)
	     [,1] [,2] [,3] [,4]
	[1,]    1    2    3    4
	[2,]    1    2    3    4
	[3,]    1    2    3    4
	[4,]    1    2    3    4


Repeating a list of characters into a matrix::

	> l <- list("a", "b", "c", "d")
	> mode(l)
	[1] "list"
	> class(l)
	[1] "list"
	> mode(l[[1]])
	[1] "character"
	> class(l[[1]])
	[1] "character"
	> m <- mapply(rep, l, 4)
	> m
	     [,1] [,2] [,3] [,4]
	[1,] "a"  "b"  "c"  "d" 
	[2,] "a"  "b"  "c"  "d" 
	[3,] "a"  "b"  "c"  "d" 
	[4,] "a"  "b"  "c"  "d" 
	> mode(m)
	[1] "character"
	> class(m)
	[1] "matrix"

One more example::

	> l <- list("aa", "bb", "cc", "dd")
	> m <- mapply(rep, l, 4)
	> m
	     [,1] [,2] [,3] [,4]
	[1,] "aa" "bb" "cc" "dd"
	[2,] "aa" "bb" "cc" "dd"
	[3,] "aa" "bb" "cc" "dd"
	[4,] "aa" "bb" "cc" "dd"

Coercion is applied when necessary::

	> l <- list(1, "bb", T, 4.5)
	> m <- mapply(rep, l, 4)
	> m
	     [,1] [,2] [,3]   [,4] 
	[1,] "1"  "bb" "TRUE" "4.5"
	[2,] "1"  "bb" "TRUE" "4.5"
	[3,] "1"  "bb" "TRUE" "4.5"
	[4,] "1"  "bb" "TRUE" "4.5"


