Text Processing
========================


Strings or Character Vectors
----------------------------------------

Forming a character vector::

	> 'abc'
	[1] "abc"
	> "abc"
	[1] "abc"

A vector of character vectors::

	> c("abc", "xyz")
	[1] "abc" "xyz"

.. index:: paste

.. rubric:: Pasting

``paste`` takes multiple character vectors as input, combines them element by 
element using a separator, and collapses the resulting character vector if
required.


Combining two character vectors::

	> paste(c('a', 'b', 'c'), c('x', 'y', 'z'))
	[1] "a x" "b y" "c z"

The default separator is blank space. Changing the separator::

	> paste(c('a', 'b', 'c'), c('x', 'y', 'z'), sep='')
	[1] "ax" "by" "cz"
	> paste(c('a', 'b', 'c'), c('x', 'y', 'z'), sep='-')
	[1] "a-x" "b-y" "c-z"
	>

By default the result is another character vector. It is possible to collapse the result into a single string::

	> paste(c('a', 'b', 'c'), c('x', 'y', 'z'), sep='', collapse=' ')
	[1] "ax by cz"
	> paste(c('a', 'b', 'c'), c('x', 'y', 'z'), sep='', collapse='')
	[1] "axbycz"
	> paste(c('a', 'b', 'c'), c('x', 'y', 'z'), sep='', collapse='o')
	[1] "axobyocz"
	> paste(c('a', 'b', 'c'), c('x', 'y', 'z'), sep='-', collapse='o')
	[1] "a-xob-yoc-z"

The smaller vector is recycled if necessary::

	> paste(c("a", "b", "c"), 1:8)
	[1] "a 1" "b 2" "c 3" "a 4" "b 5" "c 6" "a 7" "b 8"
	> paste(c("a", "b", "c"), 1:8, sep="")
	[1] "a1" "b2" "c3" "a4" "b5" "c6" "a7" "b8"


Two strings can be combined easily:: 

	> paste('hello', 'world')
	[1] "hello world"
	> paste('hello', 'world', sep='')
	[1] "helloworld"
	> paste('hello', 'world', sep='-')
	[1] "hello-world"
	> paste('hello', 'world', collapse='')
	[1] "hello world"



It automatically converts any type into strings::

	> paste(1:4, 5:8)
	[1] "1 5" "2 6" "3 7" "4 8"


Can work with more than two vectors too::

	> paste(1:5, 11:15, 21:25, 31:35, 41:45)
	[1] "1 11 21 31 41" "2 12 22 32 42" "3 13 23 33 43" "4 14 24 34 44" "5 15 25 35 45"
	> paste(1:5, 11:15, 21:25, 31:35, 41:45, sep='')
	[1] "111213141" "212223242" "313233343" "414243444" "515253545"


This approach can be used for combining multiple strings into one::

	> paste("a", "b", "c", sep="")
	[1] "abc"

It is also possible to collapse a character vector into a single string easily::

	> paste(c('a', 'b', 'c'))
	[1] "a" "b" "c"
	> paste(c('a', 'b', 'c'), collapse='')
	[1] "abc"
	> paste(c("abc", "xyz"), collapse="")
	[1] "abcxyz"



.. rubric:: Splitting strings

.. index:: strsplit

The function ``strsplit`` is the workhorse for splitting strings.
It takes a character vector (a vector of strings) and returns a list of character vectors.
Each input string corresponds to one output character vector in the output list.

Simple examples::

	> strsplit('hello world', split=' ')
	[[1]]
	[1] "hello" "world"

	> strsplit('hello world again', split=' ')
	[[1]]
	[1] "hello" "world" "again"

	> strsplit('hello-world-again', split='-')
	[[1]]
	[1] "hello" "world" "again"

	> strsplit('hello-world-again', split=' ')
	[[1]]
	[1] "hello-world-again"

Multiple character strings in input::

	> strsplit(c('hello world', 'amazing world'), split=' ')
	[[1]]
	[1] "hello" "world"

	[[2]]
	[1] "amazing" "world"  


It is possible to create a unified character vector at output::

	> unlist(strsplit(c('hello world', 'amazing world'), split=' '))
	[1] "hello"   "world"   "amazing" "world"  
	> unlist(strsplit(rep('c a', 10), split=' '))
	 [1] "c" "a" "c" "a" "c" "a" "c" "a" "c" "a" "c" "a" "c" "a" "c" "a"
	[17] "c" "a" "c" "a"


The split argument supports regular expressions::

	> unlist(strsplit('hello world-again', split='[ -]'))
	[1] "hello" "world" "again"

Splitting a name::

	> unlist(strsplit("Ryan, Mr. Edward" , split='[, .]'))
	[1] "Ryan"   ""       "Mr"     ""       "Edward"


Removing the blank strings::

	> parts <- unlist(strsplit("Ryan, Mr. Edward" , split='[, .]'))
	> parts
	[1] "Ryan"   ""       "Mr"     ""       "Edward"
	> ?filter
	> parts[parts != ""]
	[1] "Ryan"   "Mr"     "Edward"

.. rubric:: White Space

.. index:: trimws

:: 

	> trimws(' hello')
	[1] "hello"
	> trimws(' hello ')
	[1] "hello"
	> trimws('hello  ')
	[1] "hello"
	> trimws(' hello ', which='left')
	[1] "hello "
	> trimws(' hello ', which='right')
	[1] " hello"
	> trimws(' hello ', which='both')
	[1] "hello"


Pattern Matching and Replacement
-----------------------------------------

.. index:: sub, gsub, grep, grepl

``sub`` replaces the first match of a pattern with replacement string.

Trimming whitespace at the beginning::

	> sub(' ', '', ' hello')
	[1] "hello"
	> sub(' ', '', ' hello ')
	[1] "hello "


