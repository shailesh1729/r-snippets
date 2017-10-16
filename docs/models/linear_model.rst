Linear Models
===================

.. index:: linear model, lm()



We start with a simple linear model :math:`y = 2x`.

Let us prepare some test data::

    > x <- 1:10
    > y <- 2*x

Let us fit a model ``y~x`` meaning ``y`` is linearly dependent on ``x`` (with a possible bias term) as

..math::

    y = wx + c


The goal of fitting the model is to compute the weight coefficient ``w`` and the intercept or
bias or offset term ``c``::

    > lmfit <- lm(y~x)
    > lmfit

    Call:
    lm(formula = y ~ x)

    Coefficients:
    (Intercept)            x  
      2.247e-15    2.000e+00  

The coefficients can be extracted separately::

    > coefficients(lmfit)
     (Intercept)            x 
    2.246933e-15 2.000000e+00 

The fitted y values for every value of x::

    > fitted.values(lmfit)
     1  2  3  4  5  6  7  8  9 10 
     2  4  6  8 10 12 14 16 18 20 


This looks too good to be true. Let's add an intercept term and also introduce some noise::

    > n <- length(x)
    > e <- rnorm(n, sd = 0.1)
    > y <- 2*x + 3 + e


Fitting the linear mode::

    > lmfit <- lm(y~x)
    > lmfit

    Call:
    lm(formula = y ~ x)

    Coefficients:
    (Intercept)            x  
          2.933        2.008  

The intercept value is very close to 3 and the weight is also pretty close to 2.

Let's compare the fitted values with actual values of y::

    > fitted.values(lmfit)
            1         2         3         4         5         6         7         8         9 
     4.941002  6.949160  8.957318 10.965476 12.973634 14.981792 16.989951 18.998109 21.006267 
           10 
    23.014425 
    > y
     [1]  4.941495  6.895725  9.110955 10.874365 12.980755 14.998704 16.899220 19.066500
     [9] 20.932681 23.076735

We can also see the residual values::

    > residuals(lmfit)
                1             2             3             4             5             6 
     0.0004929328 -0.0534350207  0.1536365592 -0.0911108850  0.0071203406  0.0169111935 
                7             8             9            10 
    -0.0907301344  0.0683915230 -0.0735859540  0.0623094450 


Let's look at more complicated models.

A polynomial in x::

    > y <- 3 + 4*x + 5 *x^2 + rnorm(n, sd=0.1)
    > lmfit <- lm(y~1+x+I(x^2))
    > lmfit

    Call:
    lm(formula = y ~ 1 + x + I(x^2))

    Coefficients:
    (Intercept)            x       I(x^2)  
          2.945        3.965        5.005  


Multiple sinusoidal variables::

    > x <- sin(pi *seq(0, 2, by=0.05))
    > y <- cos(pi *seq(0, 2, by=0.05))
    > n <- length(x)
    > z <- 2 + 3*x + 4*y + rnorm(n, sd=0.1)
    > lmfit <- lm(z~x+y)
    > lmfit

    Call:
    lm(formula = z ~ x + y)

    Coefficients:
    (Intercept)            x            y  
          2.014        2.982        4.015  

With just 41 samples, the estimate is pretty good.

Fitting without the intercept term::

    > z <- 2 + 3*x + 4*y + rnorm(n, sd=0.1)
    > lm(z~0+x+y)

    Call:
    lm(formula = z ~ 0 + x + y)

    Coefficients:
        x      y  
    2.982  4.111  

We note that the original formula had an intercept term. This
had an undesired effect on the estimate of the weights of x and y.


Let us consider an example where the construction of z doesn't have an intercept term::

    > z <- 3*x + 4*y + rnorm(n, sd=0.1)
    > lmfit <- lm(z~0+x+y)
    > lmfit

    Call:
    lm(formula = z ~ 0 + x + y)

    Coefficients:
        x      y  
    3.003  3.984 
    > coefficients(lmfit)
           x        y 
    3.003388 3.983586 

We see that the weights of x and y are calculated correctly.

.. rubric:: Fitting on a data frame

Let's explore the relationship between the mpg and disp variables in the mtcars dataset.

Attaching the dataset::

    > attach(mtcars)

Exploring a polynomial dependency:: 

    > lmfit <- lm(disp~1+mpg+I(mpg^2))
    > lmfit

    Call:
    lm(formula = disp ~ 1 + mpg + I(mpg^2))

    Coefficients:
    (Intercept)          mpg     I(mpg^2)  
       941.2143     -53.0598       0.8101  


Measuring the quality of estimation as ratio between residuals and fitted values::

    > mean(abs(residuals(lmfit) / fitted.values(lmfit) ))
    [1] 0.1825118

