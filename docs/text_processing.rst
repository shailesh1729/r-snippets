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

Pasting::

	> paste("hello", "world")
	[1] "hello world"
	> paste("a", "b", "c", sep="")
	[1] "abc"
	> paste(c("a", "b", "c"), 1:8)
	[1] "a 1" "b 2" "c 3" "a 4" "b 5" "c 6" "a 7" "b 8"
	> paste(c("a", "b", "c"), 1:8, sep="")
	[1] "a1" "b2" "c3" "a4" "b5" "c6" "a7" "b8"
	> paste(c("abc", "xyz"), collapse="")
	[1] "abcxyz"

