> install.packages("BiocManager") --- for installing bioconductor in R
> BiocManager::install("STRINGdb") ---- for installing string database in R
> install.packages >- c(("ggraph", "igraph"))

> library(STRINGdb)
> library(igraph)
> library(ggraph)


# 2️⃣ Define your protein list

my_proteins <- data.frame(protein = c("TP53", "BRCA1", "MDM2"))


# 3️⃣ Initialize STRINGdb

string_db <- STRINGdb$new(
  version = "12",      # STRING version
  species = 9606,      # Human
  score_threshold = 400 # Minimum confidence score)

  ### the higher the score that is more than 600 or the more the score is near to 1000 the more confident we are about the protein-protein interactions


# 4️⃣ Map protein symbols to STRING IDs

mapped <- string_db$map(
  my_proteins, 
  "protein", 
  removeUnmappedRows = TRUE
)

head(mapped)  # Check mapping


# 5️⃣ Retrieve interactions

ppi <- string_db$get_interactions(mapped$STRING_id)
head(ppi)  # Check raw interactions


# 6️⃣ Convert STRING IDs to gene symbols
lookup <- setNames(mapped$protein, mapped$STRING_id)
ppi$from_name <- lookup[ppi$from]
ppi$to_name   <- lookup[ppi$to]

# Remove interactions with NA (proteins not in your list)
ppi_clean <- na.omit(ppi)
head(ppi_clean)

# 7️⃣ Build igraph object

g <- graph_from_data_frame(ppi_clean[, c("from_name", "to_name")], directed = FALSE)

# 8️⃣ Plot the network

ggraph(g, layout = "fr") +
  geom_edge_link(alpha = 0.5) +
  geom_node_point(size = 5, color = "steelblue") +
  geom_node_text(aes(label = name), repel = TRUE) +
  theme_void()
