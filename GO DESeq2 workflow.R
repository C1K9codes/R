> head(rownames(res))
> library(clusterProfiler)
> library(org.Hs.eg.db)

# Remove version numbers if present (e.g. ENSG000001.10 → ENSG000001)
> genes <- gsub("\\..*", "", rownames(sig_res))

> gene_df <- bitr(genes,
                fromType = "ENSEMBL",
                toType   = "ENTREZID",
                OrgDb    = org.Hs.eg.db)
> ego <- enrichGO(gene          = gene_df$ENTREZID,
                OrgDb         = org.Hs.eg.db,
                keyType       = "ENTREZID",
                ont           = "BP",
                pAdjustMethod = "BH",
                pvalueCutoff  = 0.05,
                qvalueCutoff  = 0.05)

> dotplot(ego, showCategory = 20) + ggtitle("GO Enrichment (BP)")
