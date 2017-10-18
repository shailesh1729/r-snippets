Date Time
=======================

Following options are available: 

* Built-in ``as.Date`` function supports dates (but no time)
* ``chron`` library supports date and time but no time-zones
* ``POSIXct`` and ``POSIXlt`` classes provide support for time zone too.

Using ``asDate`` function::

    > as.Date('1982-03-18')
    [1] "1982-03-18"
    > as.Date('1982/03/18')
    [1] "1982-03-18"
    > d <- as.Date('1982/03/18')
    > typeof(d)
    [1] "double"
    > class(d)
    [1] "Date"
    > mode(d)
    [1] "numeric"


The default format is YYYY-MM-DD where the separator can be changed.

Specifying a custom format::

    > as.Date('18/03/1982', format='%d/%m/%Y')
    [1] "1982-03-18"

The codes for the date format are listed in the table below.


.. list-table::
    :header-rows: 1

    * - Code    
      - Value
    * - %d
      - Day of the month (decimal number)
    * - %m
      - Month (decimal number)
    * - %b
      - Month (abbreviated)
    * - %B
      - Month (full name)
    * - %y
      - Year (2 digit)
    * - %Y
      - Year (4 digit)


Number of dates since Jan 1, 1970::

    > as.numeric(as.Date('1982/3/18'))
    [1] 4459


Date arithmetic::

    > d <- as.Date('1982/03/18')
    > d
    [1] "1982-03-18"
    > d + 1
    [1] "1982-03-19"
    > d + 30
    [1] "1982-04-17"
    > d - 1
    [1] "1982-03-17"
    > d - 30
    [1] "1982-02-16"

Preparing a list of dates::

    > d + seq(1, 10, by=3)
    [1] "1982-03-19" "1982-03-22" "1982-03-25" "1982-03-28"
    > d2 <- d + seq(1, 10, by=3)


Identifying corresponding weekdays::

    > weekdays(d2)
    [1] "Friday"   "Monday"   "Thursday" "Sunday"  


Corresponding months::

    > months(d2)
    [1] "March" "March" "March" "March"

Corresponding quarters::

    > quarters(d2)
    [1] "Q1" "Q1" "Q1" "Q1"

