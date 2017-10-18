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


