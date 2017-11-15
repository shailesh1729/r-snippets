Tips
==================================

This chapter contains some general tips for performing the data analysis. 
These are based on my own learnings, and will evolve over time. 


Exploratory data analysis
---------------------------------------

* Understand all the variables in their data set.
* Separate out factor variables and numerical variables.
* Distinguish between response variables and independent variables.
* Look at the histogram of numerical variables.
* If the histogram doesn't look normal, see if some data transformation can make the histogram look so.
* There is a maximum likelihood based transformation selection procedure developed by Box and Cox (1964).
* Look at the Pearson correlations between numerical variables. Categorize them between very weak, weak, moderate, strong, very strong correlations.
* Compute Spearman correlation between a factor variable with other numerical/factor variables.
* Compute factor-wise box plots of numerical variables. Examine them to see if the box plots for different levels of a factor are significantly different.


.. rubric:: Handling NA data

* Make sure that you look at raw data and identify the patterns used for entering NA values. It can be NA, na, blank space, \*, or ? etc.
* Count the number of NA entries in each column of data set.
* Identify variables with very high NA percentage. Consider if you should totally eliminate the variable from further data analysis.
* If there are very few NA entries, one approach can be to eliminate the corresponding rows.
* One way of filling NA values is by computing median / mean of the corresponding variable and using that value in all NA slots for that variable.
* Alternatively, one can use the non-NA entries in the variable and fit a linear / non-linear model for that variable from other variables which 
  have good quality data. Then, one can use this model to predict the NA entries.
* Make sure that your data-set is cleaned of NA values before serious modeling is done.


.. rubric:: Some rules of thumb

* If the ratio of maximum value to minimum value of a variable is higher than 20 then the variable 
  has significant skewness.  


.. rubric:: Outliers

* Tree based models are usually resistant to outliers


.. rubric:: PCA

* PCA is heavily influenced by original measurement scale.
* It is useful to first transform and scale individual variables before applying PCA.
* PCA is an unsupervised technique. It is blind to the modeling objective.


.. rubric:: Imputation models

* K-nearest neighbors
