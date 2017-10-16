Minimization, Maximization
==================================

The R function ``optimize`` can be used
for both minimization and maximization.
We start with discussing univariate functions.

Minimization
--------------------

A univariate function :math:`f(x)` is to be minimized 
over an interval :math:`[a, b]`. 
The value of the function :math:`f(x)` at a particular value of 
:math:`x` is called the objective.
The minimization
procedure will identify a point :math:`c \in [a,b]` such 
that :math:`f(c)` is lower than or equal to all other
values of :math:`f(x) : x \in [a,b]`.  The minimization 
procedure will return:

* The objective value at the point of minimization
* The value of :math:`x` at which the minimum is achieved.

Minimizing a function over a given interval::

	> f <- function (x) { x^ 2}
	> f(2)
	[1] 4
	> f(-2)
	[1] 4
	> optimize(f, c(-2, 2))
	$minimum
	[1] -5.551115e-17

	$objective
	[1] 3.081488e-33

	> f <- function (x) { (x-1)^ 2}
	> optimize(f, c(-2, 2))
	$minimum
	[1] 1

	$objective
	[1] 0


In the second case, :math:`f(x)` is symmetrical around :math:`x=1`.
It is possible to make this parameterized for :math:`x=a`::

	> f <- function (x, a) { (x-a)^ 2}
	> optimize(f, c(-10, 10), a=3)
	$minimum
	[1] 3

	$objective
	[1] 0

	> optimize(f, c(-10, 10), a=4)
	$minimum
	[1] 4

	$objective
	[1] 0

	> optimize(f, c(-10, 10), a=5)
	$minimum
	[1] 5

	$objective
	[1] 0


Maximization
--------------------------

Our function to be maximized::

	> f <- function(x, a) {sin(x-a)}

Maximization procedure::

	> optimize(f, c(0, pi), a=pi/4, maximum = T)
	$maximum
	[1] 2.35619

	$objective
	[1] 1

	> pi/4 + pi/2
	[1] 2.356194

