DEseq2 workflow
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("DESeq2")
BiocManager::install("airway")
BiocManager::install("SummarizedExperiment")

library(DESeq2)
library(airway)
library(SummarizedExperiment)


data("airway")
airway


colData(airway)

dds <- DESeqDataSet(airway, design = ~ cell + dex)
dds <- dds[rowSums(counts(dds)) > 1, ]
dds <- DESeq(dds)
res <- results(dds)
head(res)
resOrdered <- res[order(res$padj), ]
head(resOrdered)


summary(res)


plotMA(res, ylim = c(-5, 5))

rld <- rlog(dds, blind = FALSE)
plotPCA(rld, intgroup = "dex")



library(pheatmap)

sampleDists <- dist(t(assay(rld)))
pheatmap(as.matrix(sampleDists), clustering_distance_rows = sampleDists,
         clustering_distance_cols = sampleDists)




library(EnhancedVolcano)

EnhancedVolcano(res,
    lab = rownames(res),
    x = 'log2FoldChange',
    y = 'pvalue',
    pCutoff = 0.05,
    FCcutoff = 1.0
)


write.csv(as.data.frame(resOrdered), file="deseq2_results_airway.csv")

