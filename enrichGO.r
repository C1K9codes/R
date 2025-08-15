### cluster profiler is a bioconductor package that helps in functional enrichment of genes/proteins of our interest provided with entrez id, ensembl id or any other keytype.
### gene ontology is done to annotate genes on the basis of its-----
## 1. bological function/process -- dna repair/apoptosis
## 2. molecular function -- atp binding
## 3. cellular component -- nucleus



> library(clusterProfiler)
> library(org.Hs.eg.db)

> genes <- c("TP53", "BRCA1", "EGFR", "MYC")

> ego <- enrichGO(
  gene          = genes,
  OrgDb         = org.Hs.eg.db,
  keyType       = "SYMBOL",
  ont           = "BP",     # or MF / CC ( we can change here the ontology basis we want)
  pAdjustMethod = "BH",
  pvalueCutoff  = 0.05,
  qvalueCutoff  = 0.2)

# View results
>head(ego)

  ID                                Description GeneRatio   BgRatio RichFactor foldenrichment
GO:1902895      positive regulation of miRNA transcription       3/4  56/18805 0.05357143
GO:0071214           cellular response to abiotic stimulus       4/4 344/18805 0.01162791
GO:0104004     cellular response to environmental stimulus       4/4 344/18805 0.01162791
GO:2000630  positive regulation of miRNA metabolic process       3/4  67/18805 0.04477612
GO:1902893               regulation of miRNA transcription       3/4  76/18805 0.03947368
GO:0061614                             miRNA transcription       3/4  77/18805 0.03896104
               zScore       pvalue     p.adjust       qvalue              geneID Count
      251.8527 27.42132 9.984691e-08 2.773823e-05 5.291198e-06       TP53/EGFR/MYC     3
       54.6657 14.65254 1.100724e-07 2.773823e-05 5.291198e-06 TP53/BRCA1/EGFR/MYC     4
        54.6657 14.65254 1.100724e-07 2.773823e-05 5.291198e-06 TP53/BRCA1/EGFR/MYC     4
       210.5037 25.05718 1.724770e-07 3.252723e-05 6.204720e-06       TP53/EGFR/MYC     3
      185.5757 23.51736 2.530168e-07 3.252723e-05 6.204720e-06       TP53/EGFR/MYC     3
       183.1656 23.36311 2.632637e-07 3.252723e-05 6.204720e-06       TP53/EGFR/MYC     3





# Visualize
>dotplot(ego)


