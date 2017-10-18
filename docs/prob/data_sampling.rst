
Sampling Data
======================================================================

.. index:: sample

The population from which samples will be created::

    > v = 1:10

Sample one value from a vector::

    > sample(v, 1)
    [1] 9
    > sample(v, 1)
    [1] 1
    > sample(v, 1)
    [1] 2
    > sample(v, 1)
    [1] 9


Sampling multiple values without replacement::

    > sample(v, 4)
    [1]  1  7 10  3
    > sample(v, 4)
    [1]  6 10  5  3
    > sample(v, 4)
    [1] 10  4  1  9
    > sample(v, 4)
    [1] 5 2 4 3

Sampling all values without replacement::

    > sample(v)
     [1]  8 10  3  5  2  7  4  9  1  6
    > sample(v)
     [1]  6  7  1 10  4  5  3  9  2  8

This is essentially a random permutation of the original vector.

Sampling with replacement::

    > sample(v, replace=TRUE)
     [1]  5  1  5  5  3  7  9 10  5  6
    > sample(v, replace=TRUE)
     [1]  4  3 10  9 10  9  6  8  6  3


Notice that some values are repeating and some values are missing.

We can sample as many values as we want with replacement::

    > sample(v, 20, replace=TRUE)
     [1]  8  6  1  8  7 10  4  4  2  2  9  5  9  7  7  6  1  3  9  6

