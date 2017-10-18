
Coin Tossing
======================================================================

Bernoulli trials can be generated from the binomial distribution.
Here is a way to generate a sequence of trials::

    > rbinom(10, size=1, prob=0.5)
     [1] 0 1 0 1 1 1 0 0 1 1

We can use ``table`` to verify the distribution of 0s and 1s::

    > table(rbinom(1000, size=1, prob=0.5))

      0   1 
    513 487 

Varying the probability of 1 has the desired impact::

    > table(rbinom(1000, size=1, prob=0.4))

      0   1 
    629 371 





