K-Means Clustering
==============================

Iris Data Set
-----------------------

We will work with the iris dataset in this section. Our goal is to automatically cluster the
measurements in the data set so that measurements from the same species fall into the same
cluster. The species variable in the data set works as the ground truth. We will use the other
variables to perform clustering.

Let us estimate the correlation between different variables and the species variable::


    > cor(iris$Sepal.Length, as.integer(iris$Species), method='spearman')
    [1] 0.7980781
    > cor(iris$Sepal.Width, as.integer(iris$Species), method='spearman')
    [1] -0.4402896
    > cor(iris$Petal.Length, as.integer(iris$Species), method='spearman')
    [1] 0.9354305
    > cor(iris$Petal.Width, as.integer(iris$Species), method='spearman')
    [1] 0.9381792


The correlations suggest that petal width and petal length are very strongly correlated with 
the species of the flower. We will use these variables for the clustering purpose.

Let us prepare the subset data frame on which clustering will be applied ::

    > iris2 <- iris[, c("Petal.Length", "Petal.Width")]


We are ready to run the k-means clustering algorithm now::

    > num_clusters <- 3
    > set.seed(1111)
    > result <- kmeans(iris2, num_clusters, nstart=20)

We can see the centers for the 3 clusters as follows::

    > result$centers
      Petal.Length Petal.Width
    1     5.595833    2.037500
    2     1.462000    0.246000
    3     4.269231    1.342308

We can see the assignment of cluster to individual measurements as follows::

    > result$cluster
      [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
     [45] 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 1 3 3 3 3 3 1 3 3 3 3
     [89] 3 3 3 3 3 3 3 3 3 3 3 3 1 1 1 1 1 1 3 1 1 1 1 1 1 1 1 1 1 1 1 3 1 1 1 1 1 1 3 1 1 1 1 1
    [133] 1 1 1 1 1 1 3 1 1 1 1 1 1 1 1 1 1 1

Let us see how well the clustering has happened::

    > table(result$cluster, iris$Species)
       
        setosa versicolor virginica
      1      0          2        46
      2     50          0         0
      3      0         48         4


6 measurements have been mis-clustered.


Within cluster sum of squares by cluster::

    > result$withinss
    [1] 16.29167  2.02200 13.05769


At times, it is useful to first center and scale each variable before clustering::

    > iris3 <- scale(iris2)
    > result <- kmeans(iris3, num_clusters, nstart=20)
    > table(result$cluster, iris$Species)
       
        setosa versicolor virginica
      1      0         48         4
      2     50          0         0
      3      0          2        46
    >
