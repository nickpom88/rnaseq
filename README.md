# rnaseq
RNA-Seq code in R

Filter_genes_np2.R is an R function that removes genes with consistently low expression in an RNA-Seq analysis pipeline, based on cpm values and
the grouping of samples.
The genes are rows in the input data frame. The samples are columns. 

Important**:
1) It requires the installation of the Bioconductor edgeR package
2) It expects a data frame of raw counts as input. If other types of counts are provided, please comment the line "y<-cpm(y$counts)" and uncomment "y<-(y$counts)"
3) Samples of the same group must be in adjacent columns.


Parameters:
  #' cpm.min: The minimum CPM required to 'pass'. Standard value = 1. It has the form of a vector, where its length = n_groups.
  #' nsamples.min: The minimum number of samples for each group that must pass the cpm.min threshold, in order to keep this gene. It has the form of a vector.
  #' ncol_groups: number of columns / samples per group in the data frame, in the form a vector.
  #' n_groups: total number of groups, integer.

The functions returns a reduced data frame

Example:
We want to filter a data frame with 3 groups, made of 2,4,3 samples respectively. We want genes that pass the threshold CPM=1 in both samples of the first group, in 3 samples of the second group and 3 samples of the third group. Parameters are the following:
  #' cpm.min: c(1,1,1)
  #' nsamples.min: c(2,3,3)
  #' ncol_groups: c(2,4,3)
  #' n_groups: 3


