Permutations and Combinations
====================================

Factorial
------------

.. index:: factorial

::

    > factorial(4)
    [1] 24
    > factorial(1:4)
    [1]  1  2  6 24


.. index:: lfactorial

There is also a method to compute the log of a factorial::

    > lfactorial(1:4)
    [1] 0.0000000 0.6931472 1.7917595 3.1780538
    > exp(lfactorial(1:4))
    [1]  1  2  6 24


Gamma Function
------------------------

.. index:: gamma

This is a generalization of factorial ``gamma(n) = factorial(n-1)``.

:: 

    > gamma(1:10)
     [1]      1      1      2      6     24    120    720   5040  40320 362880
    > factorial(0:9)
     [1]      1      1      2      6     24    120    720   5040  40320 362880
    > gamma(1.5)
    [1] 0.8862269
    > factorial(.5)
    [1] 0.8862269



Binomial coefficients
-------------------------

.. index:: choose

Number of ways to choose 2 balls from an urn containing 4 balls::

    > choose(4, 2)
    [1] 6

Binomial coefficients::

    > n <- 1; choose(n, 0:n)
    [1] 1 1
    > n <- 2; choose(n, 0:n)
    [1] 1 2 1
    > n <- 3; choose(n, 0:n)
    [1] 1 3 3 1
    > n <- 4; choose(n, 0:n)
    [1] 1 4 6 4 1
    > n <- 5; choose(n, 0:n)
    [1]  1  5 10 10  5  1


Another way using foreach:: 

    > n <- 1; unlist(foreach(i=0:n) %do% choose(n,i))
    [1] 1 1
    > n <- 2; unlist(foreach(i=0:n) %do% choose(n,i))
    [1] 1 2 1
    > n <- 3; unlist(foreach(i=0:n) %do% choose(n,i))
    [1] 1 3 3 1
    > n <- 4; unlist(foreach(i=0:n) %do% choose(n,i))
    [1] 1 4 6 4 1
    > n <- 5; unlist(foreach(i=0:n) %do% choose(n,i))
    [1]  1  5 10 10  5  1
    > n <- 6; unlist(foreach(i=0:n) %do% choose(n,i))
    [1]  1  6 15 20 15  6  1
    > n <- 7; unlist(foreach(i=0:n) %do% choose(n,i))
    [1]  1  7 21 35 35 21  7  1
    > n <- 8; unlist(foreach(i=0:n) %do% choose(n,i))
    [1]  1  8 28 56 70 56 28  8  1

.. index:: lchoose

Working with natural log of choose(n,k)::

    > choose(10, 0:10)
     [1]   1  10  45 120 210 252 210 120  45  10   1
    > lchoose(10, 0:10)
     [1] 0.000000 2.302585 3.806662 4.787492 5.347108 5.529429 5.347108 4.787492 3.806662 2.302585 0.000000
    > exp(lchoose(10, 0:10))
     [1]   1  10  45 120 210 252 210 120  45  10   1


Permutations
---------------------

All permutations of 3 elements::

    > permutations(3)
         [,1] [,2] [,3]
    [1,]    1    2    3
    [2,]    2    1    3
    [3,]    2    3    1
    [4,]    1    3    2
    [5,]    3    1    2
    [6,]    3    2    1




Combinations
----------------------

Listing all combinations of k elements chosen from n elements.

6 ways to choose 2 out of 4 elements::

    > combn(4, 2)
         [,1] [,2] [,3] [,4] [,5] [,6]
    [1,]    1    1    1    2    2    3
    [2,]    2    3    4    3    4    4

4 ways to choose 3 out of 4 elements::

    > combn(4, 3)
         [,1] [,2] [,3] [,4]
    [1,]    1    1    1    2
    [2,]    2    2    3    3
    [3,]    3    4    4    4


Only one way to choose 4 out of 4 elements::

    > combn(4,4)
         [,1]
    [1,]    1
    [2,]    2
    [3,]    3
    [4,]    4
