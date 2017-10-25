Graphics Devices
========================

.. index:: graphics devices, dev.off, dev.cur, dev.list, dev.next, dev.prev, graphics.off, null device

Closing current graphics device::

    > dev.off()



List of graphics devices::

    > dev.list()

Closing all current graphics devices::

    > graphics.off()

Let's see what happens when we create our first plot::

    > plot(faithful)
    > dev.list()
    RStudioGD       png 
            2         3 
    > dev.list()
    RStudioGD       png 
            2         3

Identifying current graphics device::

    > dev.cur()
    RStudioGD 
            2 

Identifying the next graphics device:: 

    > dev.next()
    png 
      3 
    > dev.next(1)
    RStudioGD 
            2 
    > dev.next(2)
    png 
      3 
    > dev.next(3)
    RStudioGD 
            2 
    > dev.next(4)
    RStudioGD 
            2 

Previous graphics device::

    > dev.prev()
    png 
      3 
    > dev.prev(3)
    RStudioGD 
            2 


Picking the RStudio plot device::

    > dev.list()['RStudioGD']
    RStudioGD 
            2 


Closing the current graphics device only if it is present::

    if(!is.null(dev.list())) dev.off()


We should never attempt to close device no 1 which is the null device.
If you have closed all devices then::

    > dev.cur()
    null device 
              1 


Here is a way to close current device if it is not 1::

    > while (dev.cur()>1) dev.off()
