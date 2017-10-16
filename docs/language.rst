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

	function_name <- function (arglist){
		body
	}

Defining our own mean function::

	my_mean <- function(x){
	   s <- sum(x)
	   n <- length(x)
	   s / n
	}

Using the function:: 

	> my_mean(rivers)
	[1] 591.1844

Verifying against built-in implementation of mean:: 

	> mean(rivers)
	[1] 591.1844


A log-sum-exp function::

	log_sum_exp <- function(x){
	  xx <- exp(x)
	  xxx <- sum(xx)
	  log(xxx)
	}

Let us store its definition into a file named ``my_functions.R``.

.. index:: source

Loading the function definition::

	> source('my_functions.R')

Calling the function::

	> log_sum_exp(10)
	[1] 10
	> log_sum_exp(c(10, 12))
	[1] 12.12693
	> log_sum_exp(sample(1:100, 100, replace=T))
	[1] 100.4429


.. rubric:: Recursive Functions
.. index:: recursion

Let us solve the Tower of Hanoi problem in R::

	hanoi <- function(num_disks, from, to, via, disk_num=num_disks){
		if (num_disks == 1){
			cat("move disk", disk_num,  "from ", from, "to", to, "\n")
		}else{
	        hanoi(num_disks-1, from, via, to)
			hanoi(1, from, to, via, disk_num)
			hanoi(num_disks-1, via, to, from)
		}
	}


Let's see this in action::


	> hanoi(1,'a', 'b', 'c')
	move disk 1 from  a to b 
	> hanoi(2,'a', 'b', 'c')
	move disk 1 from  a to c 
	move disk 2 from  a to b 
	move disk 1 from  c to b 
	> hanoi(3,'a', 'b', 'c')
	move disk 1 from  a to b 
	move disk 2 from  a to c 
	move disk 1 from  b to c 
	move disk 3 from  a to b 
	move disk 1 from  c to a 
	move disk 2 from  c to b 
	move disk 1 from  a to b 


Closure in Lexical Scope
'''''''''''''''''''''''''''''''''''''''
.. index:: scope, lexical scope, <<-

Accessing variable in the lexical scope::


	fourth_power <- function(n){
	  sq <- function() n* n
	  sq() * sq()
	}


Let's see this function in action::

	> fourth_power(2)
	[1] 16
	> fourth_power(3)
	[1] 81


Let's create a counter generator function::

	counter <- function(n){
	  list(
	    increase = function(){
	      n <<- n+1
	    },
	    decrease = function(){
	      n <<- n-1
	    },
	    value = function(){
	      n
	    }
	  )
	}

The value ``n`` is the initial value of the counter. This gets stored
in the closure for the function. The function returns a list
whose members are functions which manipulate the value of
``n`` sitting in the closure.

The operator ``<<-`` is used to update a variable in lexical scope.

Let's now construct a counter object::

	> v <- counter(10)
	> v$value()
	[1] 10

Let's increase and decrease counter values::

	> v$increase()
	> v$increase()
	> v$value()
	[1] 12
	> v$decrease()
	> v$decrease()
	> v$value()
	[1] 10



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



Missing Data
----------------------------

.. index:: na, missing values, missing data

R has extensive support for missing data.

A vector with missing values::

	> x <- c(1, -1, 1, NA, -2, 1, -3, 4, NA, NA, 3, 2, -4, -3, NA)

Identifying entries in ``x`` which are missing::

	> is.na(x)
	 [1] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE

Extracting non-missing values from ``x``::

	> x[!is.na(x)]
	 [1]  1 -1  1 -2  1 -3  4  3  2 -4 -3


By defaulting summing NA values gives us NA::

	> sum(x)
	[1] NA

We can ignore missing values while calculating the sum::

	> sum(x, na.rm = T)
	[1] -1


Ignoring missing values for calculating mean::

	> mean(x)
	[1] NA
	> mean(x, na.rm = T)
	[1] -0.09090909

Ignoring missing values for calculating variance::

	> var(x)
	[1] NA
	> var(x, na.rm = T)
	[1] 7.090909


Recording a missing value::

	> x[1] <- NA


.. index:: na.omit

Creating a new dataset without the missing data::

	> y<-na.omit(x)
	> y
	 [1] -1  1 -2  1 -3  4  3  2 -4 -3
	attr(,"na.action")
	[1]  1  4  9 10 15
	attr(,"class")
	[1] "omit"

.. index:: na.fail


Failing and error out in presence of missing values::

	> na.fail(x)
	Error in na.fail.default(x) : missing values in object
	> na.fail(y)
	 [1] -1  1 -2  1 -3  4  3  2 -4 -3
	attr(,"na.action")
	[1]  1  4  9 10 15
	attr(,"class")
	[1] "omit"




Classes
-------------------------

A generic function performs a task or action on its arguments specific to the class of the argument itself.
If the argument doesn't have a class attribute, then the default version of the generic function is called.

Various versions of the generic function ``plot``::

	> methods(plot)
	 [1] plot.acf*           plot.bclust*        plot.data.frame*    plot.decomposed.ts* plot.default       
	 [6] plot.dendrogram*    plot.density*       plot.ecdf           plot.factor*        plot.formula*      
	[11] plot.function       plot.hclust*        plot.histogram*     plot.HoltWinters*   plot.ica*          
	[16] plot.isoreg*        plot.lm*            plot.medpolish*     plot.mlm*           plot.ppr*          
	[21] plot.prcomp*        plot.princomp*      plot.profile.nls*   plot.raster*        plot.SOM*          
	[26] plot.somgrid*       plot.spec*          plot.stepfun        plot.stft*          plot.stl*          
	[31] plot.svm*           plot.table*         plot.ts             plot.tskernel*      plot.TukeyHSD*     
	[36] plot.tune*         



Generic methods associated with ``matrix`` class::

	> methods(class="matrix")
	 [1] anyDuplicated as.data.frame as.raster     boxplot       coerce        determinant   duplicated   
	 [8] edit          head          initialize    isSymmetric   Math          Math2         Ops          
	[15] relist        subset        summary       tail          unique       


Generic methods associated with ``table`` class::

	> methods(class="table")
	 [1] [             aperm         as.data.frame Axis          coerce        head          initialize   
	 [8] lines         plot          points        print         show          slotsFromS3   summary      
	[15] tail         


Some of the functions may not be visible. They are marked with *::

	> methods(coef)
	[1] coef.aov*     coef.Arima*   coef.default* coef.listof*  coef.maov*    coef.nls*    

