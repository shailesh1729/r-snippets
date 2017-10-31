

Basic Statistics
==============================

.. index:: summary, median, min, max, range

.. rubric:: Summary Statistics


Some data::

	> x <- rnorm(100)

Maximum value::

	> max(x)
	[1] 3.251759

Minimum value::

	> min(x)
	[1] -2.340614

Sum of all values::

	> sum(x)
	[1] 8.446345

Mean of all values::

	> mean(x)
	[1] 0.08446345

Median of all values::

	> median(x)
	[1] 0.0814703

Range (min, max) of all values::

	> range(x)
	[1] -2.340614  3.251759
	

.. index:: pmax, pmin

Parallel max and min::

	> a <- sample(1:10)
	> b <- sample(1:10)
	> a
	 [1]  8  5  9 10  4  2  6  1  7  3
	> b
	 [1]  4  6  9 10  2  8  7  1  3  5
	> pmax(a,b)
	 [1]  8  6  9 10  4  8  7  1  7  5
	> pmin(a,b)
	 [1]  4  5  9 10  2  2  6  1  3  3


Summary statistics for all variables in a data frame can be 
obtained simultaneously::

	> data("mtcars")
	> summary(mtcars)
	      mpg             cyl             disp             hp             drat             wt       
	 Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0   Min.   :2.760   Min.   :1.513  
	 1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5   1st Qu.:3.080   1st Qu.:2.581  
	 Median :19.20   Median :6.000   Median :196.3   Median :123.0   Median :3.695   Median :3.325  
	 Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7   Mean   :3.597   Mean   :3.217  
	 3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0   3rd Qu.:3.920   3rd Qu.:3.610  
	 Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0   Max.   :4.930   Max.   :5.424  
	      qsec             vs               am              gear            carb      
	 Min.   :14.50   Min.   :0.0000   Min.   :0.0000   Min.   :3.000   Min.   :1.000  
	 1st Qu.:16.89   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:3.000   1st Qu.:2.000  
	 Median :17.71   Median :0.0000   Median :0.0000   Median :4.000   Median :2.000  
	 Mean   :17.85   Mean   :0.4375   Mean   :0.4062   Mean   :3.688   Mean   :2.812  
	 3rd Qu.:18.90   3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:4.000   3rd Qu.:4.000  
	 Max.   :22.90   Max.   :1.0000   Max.   :1.0000   Max.   :5.000   Max.   :8.000  

.. rubric:: Variance, Covariance
.. index:: variance, var, cov, covariance

Computing the sample variance::

	> var(mtcars$mpg)
	[1] 36.3241

The mean square value::

	> n <- length(mtcars$mpg)
	> ms <- sum(mtcars$mpg^2) / n
	> ms
	[1] 438.8222

Verifying the variance and mean square value relationship::

	> ms - mean(mtcars$mpg)^2
	[1] 35.18897
	> var(mtcars$mpg)  * (n - 1) / n
	[1] 35.18897


Computing the variance of each variable in a data frame::

	> round(sapply(mtcars, var), digits=2)
	     mpg      cyl     disp       hp     drat       wt     qsec       vs       am     gear     carb 
	   36.32     3.19 15360.80  4700.87     0.29     0.96     3.19     0.25     0.25     0.54     2.61 


Variances of selected columns::

	> sapply(mtcars[, c('cyl', 'disp', 'wt')], var)
	         cyl         disp           wt 
	    3.189516 15360.799829     0.957379 

Computing the covariance matrix for all variables in a data frame::

	> round(cov(mtcars), digits=2)
	         mpg    cyl     disp      hp   drat     wt   qsec     vs     am   gear  carb
	mpg    36.32  -9.17  -633.10 -320.73   2.20  -5.12   4.51   2.02   1.80   2.14 -5.36
	cyl    -9.17   3.19   199.66  101.93  -0.67   1.37  -1.89  -0.73  -0.47  -0.65  1.52
	disp -633.10 199.66 15360.80 6721.16 -47.06 107.68 -96.05 -44.38 -36.56 -50.80 79.07
	hp   -320.73 101.93  6721.16 4700.87 -16.45  44.19 -86.77 -24.99  -8.32  -6.36 83.04
	drat    2.20  -0.67   -47.06  -16.45   0.29  -0.37   0.09   0.12   0.19   0.28 -0.08
	wt     -5.12   1.37   107.68   44.19  -0.37   0.96  -0.31  -0.27  -0.34  -0.42  0.68
	qsec    4.51  -1.89   -96.05  -86.77   0.09  -0.31   3.19   0.67  -0.20  -0.28 -1.89
	vs      2.02  -0.73   -44.38  -24.99   0.12  -0.27   0.67   0.25   0.04   0.08 -0.46
	am      1.80  -0.47   -36.56   -8.32   0.19  -0.34  -0.20   0.04   0.25   0.29  0.05
	gear    2.14  -0.65   -50.80   -6.36   0.28  -0.42  -0.28   0.08   0.29   0.54  0.33
	carb   -5.36   1.52    79.07   83.04  -0.08   0.68  -1.89  -0.46   0.05   0.33  2.61



Computing the covariance matrix of selected variables::

	> cov(mtcars[, c('cyl', 'disp', 'wt')])
	            cyl       disp         wt
	cyl    3.189516   199.6603   1.367371
	disp 199.660282 15360.7998 107.684204
	wt     1.367371   107.6842   0.957379


.. index:: sd, standard deviation


Computing the standard deviation::

	> sd(mtcars$mpg)
	[1] 6.026948


Standard deviation of each variable in a data frame::

	> sapply(mtcars, sd)
	        mpg         cyl        disp          hp        drat          wt        qsec          vs 
	  6.0269481   1.7859216 123.9386938  68.5628685   0.5346787   0.9784574   1.7869432   0.5040161 
	         am        gear        carb 
	  0.4989909   0.7378041   1.6152000 


.. rubric:: Pearson Correlation

.. index:: cor, pearson correlation

Pearson correlation coefficients are useful in estimating dependence between different variables.
The value varies from 0 to 1. This corresponds between no correlation to complete correlation.

.. list-table::
    :header-rows: 1

    * - Pearson coefficient 
      - Interpretation
    * - 0.00 - 0.19
      - very weak correlation
    * - 0.20 - 0.39
      - weak correlation
    * - 0.40 - 0.59
      - moderate correlation
    * - 0.60 - 0.79
      - strong correlation
    * - 0.80 - 1.00
      - very strong correlation




Computing Pearson correlation coefficients for all variables in a data frame::

	> round(cor(mtcars), digits=2)
	       mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
	mpg   1.00 -0.85 -0.85 -0.78  0.68 -0.87  0.42  0.66  0.60  0.48 -0.55
	cyl  -0.85  1.00  0.90  0.83 -0.70  0.78 -0.59 -0.81 -0.52 -0.49  0.53
	disp -0.85  0.90  1.00  0.79 -0.71  0.89 -0.43 -0.71 -0.59 -0.56  0.39
	hp   -0.78  0.83  0.79  1.00 -0.45  0.66 -0.71 -0.72 -0.24 -0.13  0.75
	drat  0.68 -0.70 -0.71 -0.45  1.00 -0.71  0.09  0.44  0.71  0.70 -0.09
	wt   -0.87  0.78  0.89  0.66 -0.71  1.00 -0.17 -0.55 -0.69 -0.58  0.43
	qsec  0.42 -0.59 -0.43 -0.71  0.09 -0.17  1.00  0.74 -0.23 -0.21 -0.66
	vs    0.66 -0.81 -0.71 -0.72  0.44 -0.55  0.74  1.00  0.17  0.21 -0.57
	am    0.60 -0.52 -0.59 -0.24  0.71 -0.69 -0.23  0.17  1.00  0.79  0.06
	gear  0.48 -0.49 -0.56 -0.13  0.70 -0.58 -0.21  0.21  0.79  1.00  0.27
	carb -0.55  0.53  0.39  0.75 -0.09  0.43 -0.66 -0.57  0.06  0.27  1.00

Computing Pearson correlation coefficients for selected variables::

	> cor(mtcars[, c('cyl', 'disp', 'wt')])
	           cyl      disp        wt
	cyl  1.0000000 0.9020329 0.7824958
	disp 0.9020329 1.0000000 0.8879799
	wt   0.7824958 0.8879799 1.0000000

.. rubric:: Tukey Five Number Summary

.. index:: Tukey five number summary, fivenum

The five numbers include: minimum, lower-hinge, median, upper-hinge, maximum::

	> fivenum(mtcars$mpg)
	[1] 10.40 15.35 19.20 22.80 33.90


.. rubric:: Quantiles

.. index:: quantile

Computing the quantiles of a given data::

	> quantile(mtcars$mpg)
	    0%    25%    50%    75%   100% 
	10.400 15.425 19.200 22.800 33.900 
	> quantile(sort(mtcars$mpg))
	    0%    25%    50%    75%   100% 
	10.400 15.425 19.200 22.800 33.900 
	> quantile(mtcars$mpg, probs=c(0.1, 0.2, 0.4, 0.8, 1.0))
	  10%   20%   40%   80%  100% 
	14.34 15.20 17.92 24.08 33.90 

.. index:: IQR, inter quantile range

::

	> IQR(mtcars$mpg)
	[1] 7.375


.. index:: median absolute deviation, mad
.. rubric:: Median Absolute Deviation

::

	> mad(mtcars$mpg)
	[1] 5.41149



.. rubric:: Skewness
.. index:: skewness

This is available in ``e1071`` library::

	> library(e1071)
	> skewness(mtcars$mpg)
	[1] 0.610655
	> skewness(discoveries)
	[1] 1.2076


.. rubric:: Kurtosis
.. index:: kurtosis

This is available in ``e1071`` library::

	> library(e1071)
	> kurtosis(mtcars$mpg)
	[1] -0.372766
	> kurtosis(discoveries)
	[1] 1.989659

* Samples with negative kurtosis value are called *platykurtic*.
* Samples with positive kurtosis values are called *leptokurtic*.
* Samples with kurtosis very close to 0 are called *mesokurtic*.

.. rubric:: Scaling or Standardizing a Variable

.. index:: scale, scaling, zero mean  unit variance

Let us pick a variable and check its mean and variance::

	> x <- mtcars$mpg
	> mean(x)
	[1] 20.09062
	> var(x)
	[1] 36.3241

Let us now scale it to zero mean unit variance::

	> y <- scale(x)
	> mean(y)
	[1] 7.112366e-17
	> var(y)
	     [,1]
	[1,]    1




Group wise statistics
'''''''''''''''''''''''''''''''

.. index:: tapply

We will compute summary statistics for each species in iris database::

	> data("iris")
	> summary(iris)
	  Sepal.Length    Sepal.Width     Petal.Length    Petal.Width          Species  
	 Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100   setosa    :50  
	 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300   versicolor:50  
	 Median :5.800   Median :3.000   Median :4.350   Median :1.300   virginica :50  
	 Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199                  
	 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800                  
	 Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500                  
	> tapply(iris$Petal.Length, iris$Species, summary)
	$setosa
	   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
	  1.000   1.400   1.500   1.462   1.575   1.900 

	$versicolor
	   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
	   3.00    4.00    4.35    4.26    4.60    5.10 

	$virginica
	   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
	  4.500   5.100   5.550   5.552   5.875   6.900 


We can compute individual group-wise statistics too::

	> tapply(iris$Petal.Length, iris$Species, mean)
	    setosa versicolor  virginica 
	     1.462      4.260      5.552 
	> tapply(iris$Petal.Length, iris$Species, max)
	    setosa versicolor  virginica 
	       1.9        5.1        6.9 
	> tapply(iris$Petal.Length, iris$Species, var)
	    setosa versicolor  virginica 
	0.03015918 0.22081633 0.30458776 
	> tapply(iris$Petal.Length, iris$Species, min)
	    setosa versicolor  virginica 
	       1.0        3.0        4.5 



Frequency Tables
----------------------

.. index:: table()

When we factor a list into levels, we can compute the frequency table from the factors as follows::

	> states <- sample(datasets::state.name[1:10], 20, replace=TRUE)
	> statesf <- factor(states)
	> table(statesf)
	statesf
	    Alabama      Alaska     Arizona  California    Colorado Connecticut    Delaware     Florida     Georgia 
	          1           1           1           2           2           2           3           5           3 


.. index:: prop.table

Looking at the tabulation in proportional terms::

	> states <- sample(datasets::state.name[1:10], 20, replace=TRUE)
	> statesf <- factor(states)
	> prop.table(table(statesf))
	statesf
	   Alabama     Alaska   Arkansas California   Colorado   Delaware    Florida    Georgia 
	      0.05       0.10       0.25       0.15       0.05       0.15       0.15       0.10 




.. rubric:: Building a two-dimensional frequency table

.. index:: two dimensional frequency table, contingency table

Here is a simple example. We will extract the fuel type and vehicle class from
the mpg data set and tabulate the co-occurrence of  pairs of these two
variables::

	> table(mpg[, c('fl', 'class')])
	   class
	fl  2seater compact midsize minivan pickup subcompact suv
	  c       0       0       0       0      0          1   0
	  d       0       1       0       0      0          2   2
	  e       0       0       0       1      3          0   4
	  p       5      21      15       0      0          3   8
	  r       0      25      26      10     30         29  48


Let's convert this table into a simple data frame::

	> df <- as.data.frame(table(mpg[, c('fl', 'class')]))
	> df[df$Freq != 0,]
	   fl      class Freq
	4   p    2seater    5
	7   d    compact    1
	9   p    compact   21
	10  r    compact   25
	14  p    midsize   15
	15  r    midsize   26
	18  e    minivan    1
	20  r    minivan   10
	23  e     pickup    3
	25  r     pickup   30
	26  c subcompact    1
	27  d subcompact    2
	29  p subcompact    3
	30  r subcompact   29
	32  d        suv    2
	33  e        suv    4
	34  p        suv    8
	35  r        suv   48

Note that only 18 of the rows (or combinations of fuel type and vehicle class)
have non-zero entries. 

US states income data::

	> incomes <- datasets::state.x77[,2]
	> summary(incomes)
	   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
	   3098    3993    4519    4436    4814    6315 

Categorizing the income data::

	> incomes_fr <- cut(incomes, breaks=2500+1000*(0:4), dig.lab = 4)
	> incomes_fr
	 [1] (3500,4500] (5500,6500] (4500,5500] (2500,3500] (4500,5500] (4500,5500] (4500,5500] (4500,5500]
	 [9] (4500,5500] (3500,4500] (4500,5500] (3500,4500] (4500,5500] (3500,4500] (4500,5500] (4500,5500]
	[17] (3500,4500] (3500,4500] (3500,4500] (4500,5500] (4500,5500] (4500,5500] (4500,5500] (2500,3500]
	[25] (3500,4500] (3500,4500] (4500,5500] (4500,5500] (3500,4500] (4500,5500] (3500,4500] (4500,5500]
	[33] (3500,4500] (4500,5500] (4500,5500] (3500,4500] (4500,5500] (3500,4500] (4500,5500] (3500,4500]
	[41] (3500,4500] (3500,4500] (3500,4500] (3500,4500] (3500,4500] (4500,5500] (4500,5500] (3500,4500]
	[49] (3500,4500] (4500,5500]
	Levels: (2500,3500] (3500,4500] (4500,5500] (5500,6500]

Tabulating the income data frequencies::

	> table(incomes_fr)
	incomes_fr
	(2500,3500] (3500,4500] (4500,5500] (5500,6500] 
	          2          22          25           1 

US states illiteracy data::


	> illiteracy <- datasets::state.x77[,3]
	> summary(illiteracy)
	   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
	  0.500   0.625   0.950   1.170   1.575   2.800 

Categorizing the illiteracy data::

	> illiteracy_fr <- cut(illiteracy, breaks=c(0, .5, 1.0, 1.5, 2.0,2.5, 3.0))
	> illiteracy_fr
	 [1] (2,2.5] (1,1.5] (1.5,2] (1.5,2] (1,1.5] (0.5,1] (1,1.5] (0.5,1] (1,1.5] (1.5,2] (1.5,2] (0.5,1] (0.5,1]
	[14] (0.5,1] (0,0.5] (0.5,1] (1.5,2] (2.5,3] (0.5,1] (0.5,1] (1,1.5] (0.5,1] (0.5,1] (2,2.5] (0.5,1] (0.5,1]
	[27] (0.5,1] (0,0.5] (0.5,1] (1,1.5] (2,2.5] (1,1.5] (1.5,2] (0.5,1] (0.5,1] (1,1.5] (0.5,1] (0.5,1] (1,1.5]
	[40] (2,2.5] (0,0.5] (1.5,2] (2,2.5] (0.5,1] (0.5,1] (1,1.5] (0.5,1] (1,1.5] (0.5,1] (0.5,1]
	Levels: (0,0.5] (0.5,1] (1,1.5] (1.5,2] (2,2.5] (2.5,3]

Tabulating the illiteracy data frequencies::

	> table(illiteracy_fr)
	illiteracy_fr
	(0,0.5] (0.5,1] (1,1.5] (1.5,2] (2,2.5] (2.5,3] 
	      3      23      11       7       5       1 


Tabulating income vs illiteracy ::


	> table(incomes_fr, illiteracy_fr)
	             illiteracy_fr
	incomes_fr    (0,0.5] (0.5,1] (1,1.5] (1.5,2] (2,2.5] (2.5,3]
	  (2500,3500]       0       0       0       1       1       0
	  (3500,4500]       1      10       2       4       4       1
	  (4500,5500]       2      13       8       2       0       0
	  (5500,6500]       0       0       1       0       0       0


Aggregation
-----------------------

.. index:: aggregate

Computing mean of sepal length for each species in iris::

	> aggregate(iris$Sepal.Length, by=list(iris$Species), FUN=mean)
	     Group.1     x
	1     setosa 5.006
	2 versicolor 5.936
	3  virginica 6.588



Computing mean mileage per gallon of cars aggreated by their number of cylinders 
and V/S::

	> unique(mtcars$cyl)
	[1] 6 4 8
	> unique(mtcars$vs)
	[1] 0 1
	> aggregate(mtcars$mpg, by=list(mtcars$cyl,mtcars$vs), 
	+           FUN=mean, na.rm=TRUE)
	  Group.1 Group.2        x
	1       4       0 26.00000
	2       6       0 20.56667
	3       8       0 15.10000
	4       4       1 26.73000
	5       6       1 19.12500



Computing mean all attributes of cars aggregated by their number of cylinders and V/S::

	> aggregate(mtcars, by=list(mtcars$cyl,mtcars$vs), 
	+           FUN=mean, na.rm=TRUE)
	  Group.1 Group.2      mpg cyl   disp       hp     drat       wt     qsec vs        am
	1       4       0 26.00000   4 120.30  91.0000 4.430000 2.140000 16.70000  0 1.0000000
	2       6       0 20.56667   6 155.00 131.6667 3.806667 2.755000 16.32667  0 1.0000000
	3       8       0 15.10000   8 353.10 209.2143 3.229286 3.999214 16.77214  0 0.1428571
	4       4       1 26.73000   4 103.62  81.8000 4.035000 2.300300 19.38100  1 0.7000000
	5       6       1 19.12500   6 204.55 115.2500 3.420000 3.388750 19.21500  1 0.0000000
	      gear     carb
	1 5.000000 2.000000
	2 4.333333 4.666667
	3 3.285714 3.500000
	4 4.000000 1.500000
	5 3.500000 2.500000


Aggregation using formula :: 

	> aggregate(mpg~cyl+vs, data=mtcars, FUN=mean)
	  cyl vs      mpg
	1   4  0 26.00000
	2   6  0 20.56667
	3   8  0 15.10000
	4   4  1 26.73000
	5   6  1 19.12500

