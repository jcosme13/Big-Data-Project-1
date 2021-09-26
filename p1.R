# installing all the packages
install.packages("igraph")
library(igraph)
install.packages("plyr")
library(plyr)
install.packages("sna")
library(sna)
install.packages("CINNA")
library(CINNA)
install.packages("tidyverse")
library(tidyverse)
install.packages("reshape2")
library(reshape2)

# read the data set and assign it to g
g <- read.table("./dataset.txt", header = FALSE, sep='\t')
# create a new data frame h based on h
h <- graph.data.frame(g)
# plot h
plot.igraph(h)
# use omit function to remove any missing data
omit_h <- na.omit(h)
# plot new simplified graph and delete vertices with degree less than 10
simplified_h <- delete_vertices(simplify(omit_h), igraph::degree(omit_h)<15 | igraph::degree(omit_h)==0)
plot.igraph(simplified_h)



# convert g to matrix
# matrix <- as.matrix(g[,1:2, drop=FALSE])
# 
# matrix_h <- as.matrix(h, matrix.type = c("adjacency"))
# edgelist_h <- as_edgelist(h)

#plot.igraph(h, vertex.name = V(h)$V1)
# use simplify function on h
# is_simple(h)
# simplify(h)
# degree(h)

# # find degree centrality
matrix_g <- graph.edgelist(as.matrix(g[,1:2, drop=FALSE]), directed=FALSE)
# matrix_g <- simplify(matrix_g)
# 
# 
# # closeness centrality
# igraph::centr_clo(h) # centralization: 0.1661062, theoretical max: 26473
# 
# # betweenness centrality
# igraph::centr_betw(h) # centralization: 0.1536933, theoretical max: 1.85542e+13
# #h_net
# #V(h)$degree<-degree(h)
# #plot(h,vertex.label.cex = .6, vertex.label.color = "black", vertex.size = V(h)$degree, vertex.label.cex = .2)
# 
# # determine longest paths 
# farthest_vertices(h, directed=FALSE) # $vertices
# # + 2/26475 vertices, named, from 9705623:
# # [1] 23601 3010, distance: 17
# 
# # get diameter
# diameter(h, directed=FALSE) # 17
# 
# # find largest cliques
# h.lgcliques=igraph::clique_num(matrix_g) # 16

# find power centrality
pc <- power_centrality(simplified_h, nodes=V(simplified_h), loops=FALSE)

## (2) additional igraph functions ##

# decompose function: creates a separate graph for each component of the graph
decompose(simplified_h, mode=c("weak"), max.comps = NA, min.vertices=0)

# mean distance function: calculates the average path length in the graph
mean_distance(h)

# radius function
radius(h)

# hub score function: Kleinberg's hub centrality scores
hub_score(h)$vector

# is loop function: determines if graph contains loops
is.loop(h)

# knn function: average nearest neighbor degree
knn(h)

