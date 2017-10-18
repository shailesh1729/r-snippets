Basic Data Manipulation
=============================

Editing 
------------

.. index:: edit, fix

Two functions are available for basic editing of data: ``edit`` and ``fix``. 
They work on objects like vectors, matrices, data frames, etc..
Both of them open an editor for the user to make changes in the data object.
After the editing is done, 
``fix`` changes the object in place while ``edit`` returns a new object.

For updating an object using ``edit`` function::

    > obj <- edit(obj)

This is same as ::

    > fix(obj)


The result of edit operation can be assigned to a new object too::

    > obj2 <- edit(obj)


Loading and Saving R Objects
--------------------------------


Saving an R object::

    save(obj, file='<filename>.rda')


Loading an R object::
    
    load('<filename>.rda')



Reading and Writing Matrices and Vectors
-------------------------------------------

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

Reading and Writing Tables
-------------------------------------


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



Reading a table and converting it to a matrix::

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



.. list-table::
    :header-rows: 1
    :caption: Functions for reading tabular data

    * - Function
      - Purpose
      - Header
      - Separator
      - Decimal 

    * - ``read.table``
      - Read tabular data from file
      - Absent by default
      - 
      - .

    * - ``read.csv``
      - Read from comma separated value files
      - Present by default
      - ,
      - .

    * - ``read.csv2``
      - Read from semicolon separated value files
      - Present by default
      - ;
      - ,

    * - ``read.delim``
      - Read from tab delimited files
      - Present by default
      - \t
      - .

    * - ``read.delim2``
      - Read from tab delimited files
      - Present by default
      - \t
      - ,

