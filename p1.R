# installing packages
install.packages("igraph")
library(igraph)
install.packages("sna")
library(sna)

## (2) Create graph and plot ##

# read the data set and assign it to g
g <- read.table("./dataset.txt", header = FALSE, sep='\t')
# create a new data frame h based on h
h <- graph.data.frame(g)
# plot h
plot.igraph(h)

# simplify h by plotting from the range 1:100
simplified_h <- subgraph.edges(h, 1:100)
plot.igraph(simplified_h, edge.label = E(simplified_h)$V3, edge.label.color ="red")

## (3) Graph Analytics Functions

# String function
str(simplified_h)

# Get adjacency matrix
simplified_h.adj <- igraph::get.adjacency(simplified_h)
simplified_h.adj

# Find edge density
igraph::edge_density(simplified_h)

# Histogram of the degree of nodes
hist(igraph::degree(simplified_h))

## (4) additional igraph functions ##

# decompose function: creates a separate graph for each component of the graph
decompose(simplified_h, mode=c("weak"), max.comps = NA, min.vertices=0)

# mean distance function: calculates the average path length in the graph
mean_distance(simplified_h)

# radius function
radius(simplified_h)

# hub score function: Kleinberg's hub centrality scores
hub_score(simplified_h)$vector

# is loop function: determines if graph contains loops
is.loop(simplified_h)

# knn function: average nearest neighbor degree
knn(simplified_h)

# layout on sphere function: places the vertices (approximately) uniformly on 
# the surface of a sphere
layout_on_sphere(simplified_h)

# cluster distribution function: calculate the maximal (weakly or strongly) 
# connected components of a graph
cluster.distribution(simplified_h)

# coreness function: the k-core of graph is a maximal subgraph in which each 
# vertex has at least degree k
coreness(simplified_h)

# permute function: create a new graph by permuting vertex ids
hh<-permute(simplified_h, sample(vcount(simplified_h)))
plot.igraph(hh, edge.label = E(simplified_h)$V3, edge.label.color ="green")

## (5) ##

# closeness centrality
igraph::centr_clo(simplified_h) 

# betweenness centrality
igraph::centr_betw(simplified_h)

# determine longest paths
farthest_vertices(simplified_h, directed=FALSE)

# find largest cliques
clique_num(simplified_h)

#ego
ego_calc<-ego(simplified_h)
rand <- sample(ego_calc, 10)
print(rand)

# find power centrality
pc <- power_centrality(simplified_h, nodes=V(simplified_h), loops=FALSE, exponent=0.9)
