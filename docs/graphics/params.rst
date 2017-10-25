Parameters
========================

.. index:: par

It is possible to ask user to hit return before drawing the next graphics on device.

To switch on the asking::

    > par(ask=T)

To switch off asking::

    > par(ask=F)

When we change a parameter, it is good to store the old value somewhere and restore it later::

    > oldpar <- par(ask=T)
    > oldpar
    $ask
    [1] FALSE

    > par(oldpar)

.. list-table::
    :header-rows: 1

    * - Parameter
      - Purpose
    * - ask
      - Ask user before plotting next graphics on device
