
Standard Probability Distributions
======================================================================

Functions for several probability distributions are provided as part of R.
Some distribution are available in the global space. Additional distributions
are available through some packages.  

Each distribution has a name in R (e.g. norm, beta, t, f, etc.). 
For each distribution following functions are provided:

* Probability Density (Mass) Function (dnorm, dbeta, dt, df, etc.)
* Cumulative Distribution Function (pnorm, pbeta, , pt, pf, etc.)
* Quantile or Inverse Cumulative Distribution Function (qnorm, qbeta, qt, qf, etc.)
* Random Number Generator for the given distribution (rnorm, rbeta, rt, rf, etc.)

.. list-table::
    :header-rows: 1

    * - Distribution    
      - R name  
      - Additional arguments
    * - beta    
      - beta    
      - shape1, shape2, ncp
    * - binomial    
      - binom   
      - size, prob
    * - Cauchy  
      - cauchy  
      - location, scale
    * - chi-squared 
      - chisq   
      - df, ncp
    * - exponential 
      - exp 
      - rate
    * - F   
      - f   
      - df1, df2, ncp
    * - gamma   
      - gamma   
      - shape, scale
    * - geometric   
      - geom    
      - prob
    * - hypergeometric  
      - hyper   
      - m, n, k
    * - log-normal  
      - lnorm   
      - meanlog, sdlog
    * - logistic    
      - logis   
      - location, scale
    * - negative binomial   
      - nbinom  
      - size, prob
    * - normal  
      - norm    
      - mean, sd
    * - Poisson 
      - pois    
      - lambda
    * - signed rank 
      - signrank    
      - n
    * - Student’s t 
      - t   
      - df, ncp
    * - uniform 
      - unif    
      - min, max
    * - Weibull 
      - weibull 
      - shape, scale
    * - Wilcoxon    
      - wilcox  
      - m, n

