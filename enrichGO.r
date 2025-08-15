> library(clusterProfiler)
> library(org.Hs.eg.db)

> genes <- c("TP53", "BRCA1", "EGFR", "MYC")

> ego <- enrichGO(
  gene          = genes,
  OrgDb         = org.Hs.eg.db,
  keyType       = "SYMBOL",
  ont           = "BP",     # or MF / CC
  pAdjustMethod = "BH",
  pvalueCutoff  = 0.05,
  qvalueCutoff  = 0.2)

# View results
>head(ego)

# Visualize
>dotplot(ego)
