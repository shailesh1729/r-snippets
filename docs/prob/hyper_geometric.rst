
Hyper-Geometric Distribution
======================================================================

We have an urn which has m white balls and n black balls. We draw k balls from it.
We want to find the probability of picking x white balls.

Let's examine the simple case with m=1,n=1, k=1::

    > m <- 1
    > n <- 1
    > k <- 1
    > x <- 0:2
    > dhyper(x, m, n, k)
    [1] 0.5 0.5 0.0

There is 50% chance that the first ball is black, 50% chance that first ball is
white, and 0% chance that we have drawn 2 white balls.

Now, let us examine the situation for k=2::

    > k <- 2
    > x <- 0:3
    > dhyper(x, m, n, k)
    [1] 0 1 0 0

In two trials, both white and black balls will come out. There will be exactly
one white ball.

Let's consider the case where m=2, n=2, k=2::

    > m <- 2
    > n <- 2
    > k <- 2
    > x <-0:4
    > dhyper(x, m, n, k)
    [1] 0.1666667 0.6666667 0.1666667 0.0000000 0.0000000
 
