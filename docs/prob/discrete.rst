Discrete Distributions
======================================================================

Let us define our sample space::

    > sample.space <- c(1,2,3, 4)

Let us define the probability mass function over the sample space::

    > pmf <- c(0.25, 0.3, 0.35, 0.1)
    > sum(pmf)
    [1] 1

Let's draw some samples from this distribution::

    > sample(sample.space, size=10, replace=T, prob=pmf)
     [1] 2 3 3 3 3 4 2 1 3 2

Let's tabulate them for large number of samples::

    > table(sample(sample.space, size=10000, replace=T, prob=pmf))

       1    2    3    4 
    2578 3059 3383  980 

Let's verify their proportions::

    > prop.table(table(sample(sample.space, size=10000, replace=T, prob=pmf)))

         1      2      3      4 
    0.2522 0.3029 0.3505 0.0944 


Note that this matches quite well with the original probability mass function.
