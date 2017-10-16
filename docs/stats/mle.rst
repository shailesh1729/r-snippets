Maximum Likelihood Estimation
===================================

Estimating the Probability of Flipping Coins
---------------------------------------------------


We will generate a sequence of Bernoulli trials
and attempt to estimate the probability of 1.

Our sample sequence of coin flips::

	> x <- rbinom(100, size=1, prob=0.4)

The log likelihood function to be optimized::

	> log_likelihood <- function(p, x) sum(dbinom(x, size=1, prob = p, log=T))

The maximum likelihood estimation procedure::

	> optimize(log_likelihood, interval=c(0, 1), x=x, maximum=T)
	$maximum
	[1] 0.3599941

	$objective
	[1] -65.34182


We see significant deviation from the ideal value of 0.4. Let's try with another dataset::

	> x <- rbinom(100, size=1, prob=0.4)
	> optimize(log_likelihood, interval=c(0, 1), x=x, maximum=T)
	$maximum
	[1] 0.410003

	$objective
	[1] -67.68585


The likelihood estimate becomes stable as the number of samples increase::

	> x <- rbinom(10000, size=1, prob=0.4)
	> optimize(log_likelihood, interval=c(0, 1), x=x, maximum=T)
	$maximum
	[1] 0.3984011

	$objective
	[1] -6723.576

	> x <- rbinom(10000, size=1, prob=0.4)
	> optimize(log_likelihood, interval=c(0, 1), x=x, maximum=T)
	$maximum
	[1] 0.4080028

	$objective
	[1] -6761.223

	> x <- rbinom(10000, size=1, prob=0.4)
	> optimize(log_likelihood, interval=c(0, 1), x=x, maximum=T)
	$maximum
	[1] 0.398301

	$objective
	[1] -6723.164


Estimating the Mean of Normal Distribution
-------------------------------------------------

Let us draw some samples from a normal distribution with mean 1::

	> x <- rnorm(100, mean=4)

Let us define our log-likelihood function::

	> log_likelihood <- function(mu, x) sum(dnorm(x, mean=mu, log=T))


Let's find the maximum likelihood estimate of the mean::

	> optimize(log_likelihood, interval=c(-100, 100), x=x, maximum=T)
	$maximum
	[1] 3.869241

	$objective
	[1] -139.3414

This is not too far from the actual value of 4.

Let's try again with more data::

	> x <- rnorm(10000, mean=4)
	> optimize(log_likelihood, interval=c(-100, 100), x=x, maximum=T)
	$maximum
	[1] 3.986473

	$objective
	[1] -14266.71

We get an estimate which is very close to 4.