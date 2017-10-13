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


Arithmetic
------------

.. index:: +, ^

::

	> 10^2  + 36

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

	x <- c(1, 2, 3)

A sequence::
	
	x <- 1:4

A matrix::

	x <- matrix(1:4, nrow=2)


An array::

	x <- array(1:16, dim=c(2,2,4))

A character vector or string::

	x <- "hello"

A list::

	x <- list(a=4, b=2.4, c="hello")


A  data frame::

	frm <- data.frame(x=c(1,2,3), y=c(21, 20, 23), z=("a", "b", "c"))

