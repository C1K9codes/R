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
  qvalueCutoff  = 0.2
)

> gene_entrez <- bitr(genes, fromType = "SYMBOL", toType = "ENTREZID", OrgDb = org.Hs.eg.db)

> ekegg <- enrichKEGG(
  gene         = gene_entrez$ENTREZID,
  organism     = "hsa",      # human
  pvalueCutoff = 0.05)

> head(ekegg)

                                  category            subcategory       ID
hsa05224                       Human Diseases Cancer: specific types hsa05224
hsa05219                       Human Diseases Cancer: specific types hsa05219
hsa05213                       Human Diseases Cancer: specific types hsa05213
hsa05206                       Human Diseases       Cancer: overview hsa05206
hsa05230                       Human Diseases       Cancer: overview hsa05230
hsa04151 Environmental Information Processing    Signal transduction hsa04151
                                 Description GeneRatio  BgRatio RichFactor FoldEnrichment
hsa05224                       Breast cancer       4/4 148/9434 0.02702703       63.74324
hsa05219                      Bladder cancer       3/4  41/9434 0.07317073      172.57317
hsa05213                  Endometrial cancer       3/4  59/9434 0.05084746      119.92373
hsa05206                 MicroRNAs in cancer       4/4 319/9434 0.01253918       29.57367
hsa05230 Central carbon metabolism in cancer       3/4  71/9434 0.04225352       99.65493
hsa04151          PI3K-Akt signaling pathway       4/4 362/9434 0.01104972       26.06077
           zScore       pvalue     p.adjust       qvalue       geneID         Count
hsa05224 15.84465 5.818254e-08 4.945516e-06 1.714854e-06 7157/672/1956/4609     4
hsa05219 22.67453 3.038817e-07 1.291497e-05 4.478257e-06     7157/1956/4609     3
hsa05213 18.87157 9.253946e-07 2.621951e-05 9.091596e-06     7157/1956/4609     3
hsa05206 10.69257 1.283680e-06 2.727821e-05 9.458698e-06 7157/672/1956/4609     4
hsa05230 17.18460 1.625403e-06 2.763185e-05 9.581323e-06     7157/1956/4609     3
hsa04151 10.01374 2.133563e-06 3.022548e-05 1.048066e-05 7157/672/1956/4609     4

> dotplot(ekegg)
