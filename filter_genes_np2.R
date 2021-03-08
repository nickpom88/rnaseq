filter_genes_np2 <- function(data,the.groups,cpm.min = c(1,1), nsamples.min = c(2,2), ncol_groups=c(2,3), n_groups=2) {
  #' Filter the genes (rows in data) based on prevalence, in order to remove genes with consistently low expression. 
  #' cpm.min: The minimum CPM required to 'pass'
  #' nsamples.min: The minimum number of samples that must pass in order to keep this gene
  #' unless.cpm.gte: If supplied, this acts as an override; if any single CPM value is >= this value, the gene is retained, even if
  #' it would otherwise be earmarked for removal.
  #' Returns a reduced data frame
  
  #vectors should have length=n_groups
  
  y <- DGEList(counts=data, group=the.groups)
  #y <- DGEList(counts=dataTab2, group=the.groups)
#trials: 
  #y<-data.frame(A1=seq(40),A2=2*seq(40),A3=0.5*seq(40),B1=0.2*seq(40), B2=0.7*seq(40), B3=2.5*seq(40))
  #keep<-rowSums(y)
  #cpm.min=5
  #nsamples.min=2
  #keep <- rowSums(y > cpm.min)
  #keep <- rowSums(cpm(y) > cpm.min) >= nsamples.min
  #ncol_groups=3
  #n_groups=2
  A<-data.frame()
  y<-cpm(y$counts)
#  y<-(y$counts)
  
  keep<-rep(FALSE,nrow(y))
  for (i in seq(nrow(y))){
    for (j in seq(n_groups)) {
      A[i,j]<-sum(y[i,((sum(ncol_groups[0:(j-1)])+1):(sum(ncol_groups[0:(j-1)])+ncol_groups[j]))]>cpm.min[j])>=nsamples.min[j]
      #A[i,1]<-sum(y[i,(1:+ncol_groupC)]>cpm.min)>=nsamplesC.min #example with 2 groups
      #A[i,2]<-sum(y[i,((ncol_groupC+1):(ncol_groupC+ncol_groupT))]>cpm.min)>=nsamplesT.min #example with 2 groups
  }}
  for (i in seq(nrow(y))){
    for (j in seq(n_groups)) {
    keep[i]<-keep[i]|A[i,j]
  }}
 #y[,7:8]<-A
 #y[,9]<-keep
 data2<-data[keep,]
#  if (!is.null(unless.cpm.gte)) {
 #   keep <- keep | (rowSums(cpm(y) >= unless.cpm.gte) > 0)
  #}
  
  #data <- data[keep,]
 return(data2)
}
