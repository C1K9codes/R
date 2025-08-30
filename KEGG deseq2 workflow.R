> library(clusterProfiler)
> library(org.Hs.eg.db)
> library(enrichplot)

# filter significant genes
> sig_genes <- subset(res, padj < 0.05)

# check rownames format
> head(rownames(sig_genes))

# convert IDs (if rownames are Ensembl IDs)
> gene_df <- bitr(rownames(sig_genes),
                fromType = "ENSEMBL",   # or SYMBOL if they are gene symbols
                toType = "ENTREZID",
                OrgDb = org.Hs.eg.db)

# extract entrez IDs
> entrez_ids <- gene_df$ENTREZID

# KEGG enrichment
> ekegg <- enrichKEGG(gene         = entrez_ids,
                    organism     = "hsa",   # human
                    pvalueCutoff = 0.05)

# visualize
> dotplot(ekegg, showCategory = 20)
