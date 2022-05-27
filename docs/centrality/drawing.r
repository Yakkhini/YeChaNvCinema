library(igraph)

a_matrix_file <- read.csv("matrix.csv", header = FALSE, encoding = "UTF-8")

a_matrix <- as.matrix(a_matrix_file)

entity_id_file <- read.csv("entity_id.csv", header = FALSE, encoding = "UTF-8")

entity_id <- as.matrix(entity_id_file)

label <- entity_id[, 2]



g <- graph.adjacency(a_matrix, mode = "undirected", weighted = T)

plot(g, vertex.label = label)

print(degree(g, mode = "total"))
print(closeness(g))
print(betweenness(g, directed = FALSE))

degree_cent <- degree(g, mode = "total")
closeness_cent <- closeness(g)
betweenness_cent <- betweenness(g, directed = FALSE)

E(g)$weight

igraph.plot(g)