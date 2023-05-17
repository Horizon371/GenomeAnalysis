#install.packages("BiocManager")
#BiocManager::install("DESeq2")
#BiocManager::install("apeglm")
#BiocManager::install("genefilter")
#BiocManager::install(version = '3.16')

######################  LOAD HT SEQ DATA #################################

library(DESeq2)

read_counts="D:/Uppsala/GenomeAnalysis/readCounts"
sampleFiles <- list.files(read_counts)
condition <- c('serum', 'serum', 'serum','BH', 'BH', 'BH')
sampleTable <- data.frame(sampleName = sampleFiles,
                          fileName = sampleFiles,
                          condition = condition)
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = read_counts,
                                       design= ~ condition)
dds = DESeq(ddsHTSeq)
res <- results(dds)
summary(res)

############################################################################

get_upregulated <- function(df){
  
  key <- intersect(rownames(df)[which(df$log2FoldChange>=1)], rownames(df)[which(df$pvalue<=0.05)])
  
  results <- as.data.frame((df)[which(rownames(df) %in% key),])
  return(results)
}
get_downregulated <- function(df){
  
  key <- intersect(rownames(df)[which(df$log2FoldChange<=-1)], rownames(df)[which(df$pvalue<=0.05)])
  
  results <- as.data.frame((df)[which(rownames(df) %in% key),])
  return(results)
}

sum(res$padj < 0.001, na.rm=TRUE)

res_df <- as.data.frame(res)
res_df = res_df[abs(res_df$log2FoldChange) > 1.5, ]
res_df = res_df[res_df$padj < 0.001, ]


get_upregulated(res_df)
get_downregulated(res_df)

## PLOT HEATMAP


library(ComplexHeatmap)

df <- as.data.frame(colData(dds)["condition"])

vsd <- vst(dds, blind=FALSE)

select = assay(vsd)
select = select[rownames(select) %in% rownames(res_df),]



largestVarGenes <- head(order(rowVars(select), decreasing=TRUE),20)


pheatmap(select[largestVarGenes,], cluster_rows = T, cluster_cols = T, 
         annotation_col = df)




