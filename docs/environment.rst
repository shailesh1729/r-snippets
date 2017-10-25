R Scripting Environment
============================


Getting Help
--------------

.. index:: help

help on a function::

	> help(rnorm)

.. index:: example

Examples of using a function::

	> example(rnorm)

Starting global help::

	> help.start()


Workspace
----------------

.. index:: objects, ls

List of objects in workspace::

	> ls()

We can also use ``objects`` function::

	> objects()

.. index:: rm, remove; variable

Clear all variables from workspace::

	> rm(list=ls())

Clear a variable from workspace::

	> rm(a)


Clearing the console::

	> cat("\014")


Arithmetic
------------

.. index:: +, addition

Addition::

	> 2 + 3
	[1] 5


.. index:: -, subtraction

Subtraction::

	> 2 - 3
	[1] -1


Negation::

	> -8
	[1] -8


.. index:: *, multiplication

Multiplication::

	> 2 * 3
	[1] 6

.. index:: /, division

Division::

	> 8 / 3
	[1] 2.666667
	> 8 / -3
	[1] -2.666667

.. index:: %/%, integer division

Integer division::


	> 8 %/% 3
	[1] 2
	> -8 %/% 3
	[1] -3
	> 8 %/% -3
	[1] -3
	> -8 %/% -3
	[1] 2


.. index:: %%, remainder

Remainder::

	> 8 %% 3
	[1] 2
	> -8 %% 3
	[1] 1
	> 8 %% -3
	[1] -1
	> -8 %% -3
	[1] -2


Let us combine integer division and remainder:: 

	> 2 * 3 + 2
	[1] 8
	> -3 * 3 + 1
	[1] -8
	> (-3) * (-3) + (-1)
	[1] 8
	> (2) * (-3) + (-2) 
	[1] -8

.. index:: ^, exponentiation

Exponentiation::

	> 10^1
	[1] 10
	> 11^2
	[1] 121
	> 11^3
	[1] 1331


Some more complicated expressions ::

	> 10^2  + 36


Compounded interest over a number of years::

	> 1000 * (1 + 10/100)^5
	[1] 1610.51



Variables
--------------

.. index:: =, <-, ->

Assignment::

	> a=4
	> a<-4
	> 3 -> a
	> a
	[1] 3

Display::	

	> a

Use::

	> a*5
	> a=a+10
	> a<-a+10

.. index:: assign

Assignment through function::

	> assign("x", c(1.4, 2.3, 4.4))
	> x
	[1] 1.4 2.3 4.4

Assignments in other direction::

	2 -> x


Data Types
-----------------

A vector::

	> x <- c(1, 2, 3)
	> x
	[1] 1 2 3
	> x[1]
	[1] 1
	> x[1:2]
	[1] 1 2

A sequence::
	
	> x <- 1:4
	> x
	[1] 1 2 3 4

A matrix::

	> x <- matrix(1:4, nrow=2)
	> x
	     [,1] [,2]
	[1,]    1    3
	[2,]    2    4


An array::

	> x <- array(1:16, dim=c(2,2,4))
	> x[1,1,1]
	[1] 1
	> x[1,2,1]
	[1] 3
	> x[1,2,3]
	[1] 11


A character vector or string::

	x <- "hello"

A list::

	> x <- list(a=4, b=2.4, c="hello")
	> x$a
	[1] 4
	> x$b
	[1] 2.4
	> x$c
	[1] "hello"


A  data frame::

	> frm <- data.frame(x=c(1,2,3), y=c(21, 20, 23), z=c("a", "b", "c"))
	> frm$x
	[1] 1 2 3
	> frm$y
	[1] 21 20 23
	> frm$z
	[1] a b c
	Levels: a b c
	> frm[1,]
	  x  y z
	1 1 21 a



Extended arithmetic with vectors::

	> 11 ^ c(1,2,3,4)
	[1]    11   121  1331 14641
	> c(1,2,3,4) ^ 3
	[1]  1  8 27 64
	> c(1,2,3) * c(2,3,4)
	[1]  2  6 12


