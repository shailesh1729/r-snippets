IO
====================

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


Matrices
-----------------------

.. index:: scan

Put this data into a file named ``simple_3x4_matrix.txt``::

	0 1 2 3
	4 5 6 7
	8 9 10 11

Reading the numbers as a vector :: 

	> scan('simple_3x4_matrix.txt')
	Read 12 items
	 [1]  0  1  2  3  4  5  6  7  8  9 10 11

Reading as a matrix via scan::

	> matrix(scan('simple_3x4_matrix.txt'), nrow=3)
	Read 12 items
	     [,1] [,2] [,3] [,4]
	[1,]    0    3    6    9
	[2,]    1    4    7   10
	[3,]    2    5    8   11
	> matrix(scan('simple_3x4_matrix.txt'), nrow=3, byrow = T)
	Read 12 items
	     [,1] [,2] [,3] [,4]
	[1,]    0    1    2    3
	[2,]    4    5    6    7
	[3,]    8    9   10   11

Reading as a matrix::

	> read.table('simple_3x4_matrix.txt')
	  V1 V2 V3 V4
	1  0  1  2  3
	2  4  5  6  7
	3  8  9 10 11
	> as.matrix(read.table('simple_3x4_matrix.txt'))
	     V1 V2 V3 V4
	[1,]  0  1  2  3
	[2,]  4  5  6  7
	[3,]  8  9 10 11



Tables
------------

.. index:: read.table; data frame, write.table; data frame

Writing a data frame to file::

	> d = data.frame(a=rnorm(3), b=rnorm(3))
	> d
	           a          b
	1  0.9914006 -0.4930738
	2 -0.5068710  0.5471745
	3 -1.9964106  0.2247440
	> write.table(d, file="tst0.txt", row.names=FALSE)


Reading a data frame from file::

	> d2 = read.table(file="tst0.txt", header=TRUE)
