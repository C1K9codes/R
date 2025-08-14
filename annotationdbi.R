### annotationdbi is the database having annotations for genes/proteins.
## key functions required to run annotationdbi in R

### columns() ---- see what columns are available in the package
### keytypes() ----- same as columns function
### keys() --- you put here the name of the gene/protein ---- same as symbol
### select() ----- all the things combined together to run
### mapIds()


> library(org.hs.eg.db)
> library(AnnotationDbi)

> columns(org.hs.eg.db)
> keytypes(org.hs.eg.db)

### results ---- 
[1] "ACCNUM"       "ALIAS"        "ENSEMBL"      "ENSEMBLPROT"  "ENSEMBLTRANS" "ENTREZID"    
[7] "ENZYME"       "EVIDENCE"     "EVIDENCEALL"  "GENENAME"     "GENETYPE"     "GO"          
[13] "GOALL"        "IPI"          "MAP"          "OMIM"         "ONTOLOGY"     "ONTOLOGYALL" 
[19] "PATH"         "PFAM"         "PMID"         "PROSITE"      "REFSEQ"       "SYMBOL"      
[25] "UCSCKG"       "UNIPROT" 


### creating dataframe is necessary to connect the dots (functions) in order to get the results

ids <- c("TP53", "EGFR")
select(org.Hs.eg.db, keys = ids , columns = c("ENSEMBL", "ENTREZID", "UNIPROT"), keytype = "SYMBOL")


### IF I WANT TO HAVE IT FOR ONE 
mapIds(org.Hs.eg.db, keys = "TP53", column = "ENSEMBL", keytype = "SYMBOL", multiVals = "first")
