install.packages("igraph")
library(igraph)

g <- read.table("./dataset.txt")
h <- graph.data.frame(g)
plot(h)
plot.igraph(h)
plot.igraph(h, vertex.name = V(h)$FromNodeId)