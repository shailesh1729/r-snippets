

Singular Value Decomposition
============================================================================

.. index:: svd, singular value decomposition, singular value 

SVD (Singular Value Decomposition) stands for 
splitting a matrix :math:`A` into a product
:math:`A = U S V^H` where :math:`U` and
:math:`V` are unitary matrices and :math:`S`
is a diagonal matrix consisting of singular
values on its main diagonal arranged in non-increasing
order where all the singular values are non-negative.

Computing the singular value decomposition of a matrix::

    > A <- matrix(c(1, 2, -1, 3, -6, 9, -1, 2, 1), nrow=3)
    > svd(A)
    $d
    [1] 11.355933  2.475195  1.707690

    $u
               [,1]       [,2]       [,3]
    [1,]  0.2526715 -0.1073216 -0.9615816
    [2,] -0.5565826  0.7968092 -0.2351827
    [3,]  0.7914373  0.5946235  0.1415976

    $v
                [,1]      [,2]       [,3]
    [1,] -0.14546854 0.3602437 -0.9214464
    [2,]  0.98806904 0.1005140 -0.1166899
    [3,] -0.05058143 0.9274273  0.3705672

Largest singular value::

    svd(A)$d[1]

Smallest singular value::

    > tail(svd(A)$d, n=1)
    [1] 1.70769



Absolute value of determinant as product of singular values::

    > det(A)
    [1] -48
    > prod(svd(A)$d)
    [1] 48





