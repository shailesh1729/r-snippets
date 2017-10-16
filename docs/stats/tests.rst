
Statistical Tests
============================

In hypothesis testing, a p-value helps us determine the significance
of the results. There is a null hypothesis and an alternate hypothesis.
A hypothesis test uses p-value to weigh the strength of the evidence
is support of alternative hypothesis.

* A small p-value (typically ≤ 0.05) indicates strong evidence against the null hypothesis, so you reject the null hypothesis.

* A large p-value (> 0.05) indicates weak evidence against the null hypothesis, so you fail to reject the null hypothesis.

* p-values very close to the cutoff (0.05) are considered to be marginal (could go either way). Always report the p-value so your readers can draw their own conclusions.



Shapiro-Wilk Normality Test
--------------------------------

.. index:: normality test, shapiro.test

This test is applicable to check the normality of a univariate sample::

	> shapiro.test(ToothGrowth$len)

		Shapiro-Wilk normality test

	data:  ToothGrowth$len
	W = 0.96743, p-value = 0.1091


The null-hypothesis here is that the distribution is normally distributed.
If the p-value is > 0.05, we have weak evidence against the null hypothesis.
Hence we infer that the distribution of the data
is not significantly different from normal distribution. 

Applying the test on uniform data::

	> shapiro.test(runif(100))

		Shapiro-Wilk normality test

	data:  runif(100)
	W = 0.9649, p-value = 0.009121

Clearly the p-value is quite low, so we reject the contention that the data is normally
distributed.

For exponentially distributed data::

	> shapiro.test(rexp(100))

		Shapiro-Wilk normality test

	data:  rexp(100)
	W = 0.86374, p-value = 3.952e-08


Gamma distribution::

	> shapiro.test(rgamma(100, shape=1))

		Shapiro-Wilk normality test

	data:  rgamma(100, shape = 1)
	W = 0.86356, p-value = 3.89e-08


Binomial distribution::

	> shapiro.test(rbinom(100, size = 15, prob=0.1))

		Shapiro-Wilk normality test

	data:  rbinom(100, size = 15, prob = 0.1)
	W = 0.90717, p-value = 3.124e-06


Unpaired T-Test
---------------------
For testing the equality of means

Let us generate some data from standard normal distribution::

	> x <- rnorm(100)

Let us run the test to verify that the mean is indeed zero::

	> t.test(x)

		One Sample t-test

	data:  x
	t = -0.75685, df = 99, p-value = 0.4509
	alternative hypothesis: true mean is not equal to 0
	95 percent confidence interval:
	 -0.2401063  0.1075127
	sample estimates:
	 mean of x 
	-0.0662968 

Here the null hypothesis is that the mean is 0. The alternative hypothesis is that mean is not zero.

The p-value is 0.45 which is much larger than 0.05. We have very weak evidence against the null 
hypothesis.

Let's try again with a non-zero mean sample::

	> x <- rnorm(100, mean=1)
	> t.test(x)

		One Sample t-test

	data:  x
	t = 10.577, df = 99, p-value < 2.2e-16
	alternative hypothesis: true mean is not equal to 0
	95 percent confidence interval:
	 0.871659 1.274210
	sample estimates:
	mean of x 
	 1.072934 


Classical T-Test
------------------
For testing equality of means under the assumption of equal variances.

TODO




F-Test
-----------------

For testing the equality of variances

TODO


Two Sample Wilcoxon  Test
----------------------------

TODO


Kolmogorov-Smirnov Test
-----------------------------

TODO
