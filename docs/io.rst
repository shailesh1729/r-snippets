File System and Simple IO
==============================

.. index:: working directory, getwd

Working directory::

	> getwd()
	[1] "C:/Users/Shailesh"


.. index:: setwd

Changing working directory::

	> setwd('..')
	> getwd()
	[1] "C:/Users"
	> setwd('shailesh')
	> getwd()
	[1] "C:/Users/shailesh"


Printing 
-------------------------

.. index:: print

printing a vector::

	> x <-10
	> print(x)
	[1] 10

	> print(1:3)
	[1] 1 2 3

Printing data in a loop::

	> for (month in month.abb[1:4]){print(month)}
	[1] "Jan"
	[1] "Feb"
	[1] "Mar"
	[1] "Apr"


Printing factors::

	> fruits = c("apple", "banana", "pear", "watermelon")
	> fruit_list <- sample(fruits, 20, replace=TRUE)
	> fruit_factors <- factor(fruit_list, levels=fruits)
	> fruit_factors
	 [1] banana     apple      apple      pear       apple      apple      apple      banana     apple     
	[10] watermelon banana     watermelon apple      banana     apple      pear       banana     banana    
	[19] banana     pear      
	Levels: apple banana pear watermelon
	> print(fruit_factors)
	 [1] banana     apple      apple      pear       apple      apple      apple      banana     apple     
	[10] watermelon banana     watermelon apple      banana     apple      pear       banana     banana    
	[19] banana     pear      
	Levels: apple banana pear watermelon

Factors can be printed with quotes::

	> print(fruit_factors, quote=TRUE)
	 [1] "banana"     "apple"      "apple"      "pear"       "apple"      "apple"      "apple"      "banana"    
	 [9] "apple"      "watermelon" "banana"     "watermelon" "apple"      "banana"     "apple"      "pear"      
	[17] "banana"     "banana"     "banana"     "pear"      
	Levels: "apple" "banana" "pear" "watermelon"

Skipping the levels while printing::

	> print(fruit_factors, quote=TRUE, max.levels = 0)
	 [1] "banana"     "apple"      "apple"      "pear"       "apple"      "apple"      "apple"      "banana"    
	 [9] "apple"      "watermelon" "banana"     "watermelon" "apple"      "banana"     "apple"      "pear"      
	[17] "banana"     "banana"     "banana"     "pear" 


Controlling the number of digits in floating point numbers::

	> print(pi)
	[1] 3.141593
	> print(pi, digits=15)
	[1] 3.14159265358979
	> print(pi, digits=4)
	[1] 3.142

