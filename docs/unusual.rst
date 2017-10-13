The Unusual Parts
==============================

* Statements are called commands in R.
* We can associate names to the elements of
  a vector or a list through ``names`` function.
* For a list ``l``, ``l[1]`` is another
  list with a single element (the first element). 
  ``l[[1]]``  returns the first element as it is.
 * ``x <- 1`` and ``x -> 1`` are both assignments.
   This is in contrast to traditional languages
   where the assignment is always from right to
   left.
 * ``x = 1`` is subtly different from ``x <- 1``.
   Use ``x=1`` for named arguments in function call.
   Use ``x <- 1 `` for general assignment commands.
 * Missing values are supported by default 
   everywhere. This is by design as missing values
   are intrinsic to statistical work and R is
   primarily targeted towards statistics only.
 * A function can return a mixture of values of
   different types using a list with named values.
 * Lists also work like C/C++ structures. 
 