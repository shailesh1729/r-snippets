Small Data Sets
========================

These data sets have been picked up from `Datasets from the book: A Handbook of Small Data Sets <http://www.stat.ncsu.edu/research/sas/sicl/data/>`_ . 

Germinating Seeds
-----------------------------

This dataset studies the effect of different amounts of water on germination of seeds.

* There are two experiments: one with covered boxes and one with uncovered boxes.
* Each experiment has four boxes.
* There are six levels of water (coded as level 1 to 6).
* Each box starts with 100 seeds.
* At the end of the experiment, the number of seeds germinating in the box.
* The columns in the data set represent water levels.
* The rows represent the box numbers.
* First four rows capture the results on uncovered boxes.
* Second four rows capture the results on covered boxes.
* One entry is missing in last row.

.. literalinclude:: /workspace/germin.dat
    :language: guess


Following code shows how to read the data::


    read.germinating.seeds <- function(){
        df <- read.table('germin.dat', na.strings = '*')
        dfa <- df[1:4, ]
        dfb <- df[5:8, ]
        list(
            starting.seeds=100,
            uncovered.box.germination.data=dfa,
            covered.box.germination.data=dfb,
            water.levels=factor(1:6),
            boxes=factor(1:4)
            )
    }

