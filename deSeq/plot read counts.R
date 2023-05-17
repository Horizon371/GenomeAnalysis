library(tidyverse)
library(fs)

files <- dir("D:/Uppsala/GenomeAnalysis/readCounts", pattern = "*.txt", full.names = TRUE) 

df = data.frame(matrix(nrow = 0, ncol = 2)) 

for(i in files) {
  data1 <- read.table(i,sep="\t")
  df = rbind(data1, df)
}

h=hist(log2(df$V2), breaks=40)
text(h$mids,h$counts,labels=h$counts, adj=c(0.5, -0.5))

