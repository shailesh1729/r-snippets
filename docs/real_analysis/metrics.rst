Metric Spaces and Distances
==================================

A metric space is a set of points equipped with a distance function.


Euclidean Distance
----------------------------

This is also known as l2-distance.  For :math:`x, y \in \mathbb{R}^n`, it is defined as:

.. math::

    d(x,y) = \sqrt{\sum_{i=1}^n |x_i - y_i|^2}

Here is a simple implementation in R:: 


    distance.l2 <- function(x,y){
      sqrt(sum((abs(x - y))^2 ))
    }

Let us use this function::

    > x <- c(1,0,0)
    > y <- c(0,1,0)
    > distance.l2(x, y)
    [1] 1.414214



Manhattan Distance
-----------------------------------

This is also known as city-block distance or l1-distance.  For :math:`x, y \in \mathbb{R}^n`, it is defined as:


.. math::

    d(x,y) = \sum_{i=1}^n | x_i - y_i |

Here is a simple implementation in R:: 


    distance.l1 <- function(x,y){
      sum(abs(x-y))
    }

Using this function:: 

    > distance.l1(x, y)
    [1] 2


Max Distance
--------------------------------------


For :math:`x, y \in \mathbb{R}^n`, it is defined as:

.. math::

    d(x,y) = \max_{i=1}^n | x_i - y_i |




Here is a simple implementation in R:: 

    distance.linf <- function(x,y){
      max(abs(x - y))
    }


Using this function::

    > distance.linf(x, y)
    [1] 1


Minkowski Distance
-------------------------

This distance is a generalization of the l1, l2, and max distances. For :math:`x, y \in \mathbb{R}^n`, the Minkowski distance of order :math:`p` is defined as:

.. math::

    d(x,y) = \left [ \sum_{i=1}^n |x_i - y_i|^p \right ] ^{\frac{1}{p}}


For :math:`p=1`, it reduces to city-block distance. For :math:`p=2`, it reduces to Euclidean distance.
In the limit of :math:`p \to \infty`, it reduces to max distance.

Here is a simple implementation in R:: 

    distance.lp <- function(x, y, p){
      (sum((abs(x - y))^p))^(1/p)
    }


Using this function::

    > distance.lp(x, y, p=2)
    [1] 1.414214
    > distance.lp(x, y, p=.5)
    [1] 4
    > distance.lp(x, y, p=3)
    [1] 1.259921


Canberra Distance
-----------------------------

Canberra Distance is a weighted version of the Manhattan distance. For :math:`x, y \in \mathbb{R}^n`, it is defined as:


.. math::

    d(x,y) = \sum_{i=1}^n \frac{| x_i - y_i |}{|x_i | + | y_i | }



Here is a simple implementation in R:: 

    distance.canberra <- function(x, y){
      a1 <-  abs(x - y)
      a2 <- abs(x) + abs(y)
      a3 = a1 / a2
      sum(a1 / a2, na.rm=T)
    }

Using this function::

    > distance.canberra(x, y)
    [1] 2


Binary or Jaccard Distance
----------------------------
Jaccard distance (a.k.a. binary distance) measures the dissimilarity between sample sets. 
For :math:`x, y \in \mathbb{R}^n`
we identify :math:`A = \{i : x_i \neq 0 \}` and :math:`B = \{i : x_i \neq 0 \}`. Then the distance
is defined as:

.. math::

    d(x,y) = \frac{|A \cup B| - |A \cap B|}{|A \cup B|} = 1 - \frac{|A \cap B|}{| A \cup B |}.

Here is a simple implementation in R:: 

    distance.binary <- function(x, y){
      x <- x != 0
      y <- y != 0
      a <- sum(x & y)
      b <- sum (x | y)
      1 - (a / b)
    }

Using this function::

    > a <- c(1, 0, 3, 0)
    > b <- c(0, 2, 4, 0)
    > distance.binary(a, b)
    [1] 0.6666667




dist Function
--------------------------

R provides a function named ``dist`` which can compute all the distances described above.  This 
function works on a data frame or a matrix. Every row is treated as a separate point in  space.
If the data frame has :math:`n` rows, then the function computes :math:`n(n-1)/2` distances.
It returns an object of which ``dist`` can be used to find out distances between each pair of points.
The dist object can be converted into a :math:`n \times n` symmetric matrix containing the distances. 
By default, it computes Euclidean distances.

We will compute distances between unit-vectors in 3-dimensional space::

    > eye <- diag(3)
    > eye
         [,1] [,2] [,3]
    [1,]    1    0    0
    [2,]    0    1    0
    [3,]    0    0    1

Computing the distances::

    > d <- dist(eye)

The distances in the form of a symmetric matrix::

    > as.matrix(d)
             1        2        3
    1 0.000000 1.414214 1.414214
    2 1.414214 0.000000 1.414214
    3 1.414214 1.414214 0.000000

Computing Manhattan distances::

    > d1 <- dist(eye, method='manhattan')
    > as.matrix(d1)
      1 2 3
    1 0 2 2
    2 2 0 2
    3 2 2 0

Computing maximum distances::

    > dinf <- dist(eye, method='maximum')
    > as.matrix(dinf)
      1 2 3
    1 0 1 1
    2 1 0 1
    3 1 1 0


Minkowski distances::

    > as.matrix(dist(eye, 'minkowski', p=0.5))
      1 2 3
    1 0 4 4
    2 4 0 4
    3 4 4 0
    > as.matrix(dist(eye, 'minkowski', p=3))
             1        2        3
    1 0.000000 1.259921 1.259921
    2 1.259921 0.000000 1.259921
    3 1.259921 1.259921 0.000000


Canberra distances::

    > as.matrix(dist(eye, 'canberra'))
      1 2 3
    1 0 3 3
    2 3 0 3
    3 3 3 0


It is also straightforward to compute distance between two points as follows::

    > a <- c(1, 0, 3, 0)
    > b <- c(0, 2, 4, 0)
    > dist(rbind(a, b))
            a
    b 2.44949
    > dist(rbind(a, b), method='manhattan')
      a
    b 4
    > dist(rbind(a, b), method='maximum')
      a
    b 2


Computing the binary distance::

    > dist(rbind(a, b), method='binary')
              a
    b 0.6666667


.. rubric:: Understanding the dist object

The ``dist`` function returns an object of class ``dict``. 

Let us create 4 points for this exercise::

    > points <- diag(c(1,2,3,4))
    > points
         [,1] [,2] [,3] [,4]
    [1,]    1    0    0    0
    [2,]    0    2    0    0
    [3,]    0    0    3    0
    [4,]    0    0    0    4

Let us compute the city block distances between these points::

    > distances <- dist(points, method='manhattan')

Check the class of the returned value::

    > class(distances)
    [1] "dist"


Let us print the distances::

    > distances
      1 2 3
    2 3    
    3 4 5  
    4 5 6 7
    > as.matrix(distances)
      1 2 3 4
    1 0 3 4 5
    2 3 0 5 6
    3 4 5 0 7
    4 5 6 7 0

If you note carefully, you can see that the distances object contains the lower triangle of the
distance matrix [below the diagonal]. For 4 points, it stores 6 distances (1 + 2 + 3 = 4 * 3 / 2 = 6).

The number of points for which distances were calculated can be accessed from the dist object as follows::

    > attr(distances, 'Size')
    [1] 4

The dist object is a one dimensional vector. Assuming that there are n-points, then
the distance between i-th point and j-th point 
where (1 <= i < j <= n) is stored at p-th index in the dist object where p is given by the following formula:

.. math::

    p = n(i-1) - i(i-1)/2 + j-i

Let us get n first::

    > n <- attr(distances, 'Size')

Let us say we want to find the distance between 2nd and 4th point::

    > i <- 2; j <- 4;
    > distances[n*(i-1) - i*(i-1)/2 + j-i]
    [1] 6

You can match the same with the distance matrix presented above. I guess it is much easier to first convert
the dist object into a distance matrix and then work with it.


