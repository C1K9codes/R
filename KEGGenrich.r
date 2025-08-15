






gene_entrez <- bitr(genes, fromType = "SYMBOL", toType = "ENTREZID", OrgDb = org.Hs.eg.db)

ekegg <- enrichKEGG(
  gene         = gene_entrez$ENTREZID,
  organism     = "hsa",      # human
  pvalueCutoff = 0.05
)

dotplot(ekegg)
