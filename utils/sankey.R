library("igraph")
library("networkD3")

data <- read.csv("../data/issues.csv")
closes <- data[data$state == " closed",]
relations <- data.frame(from=closes$created_by,
                        to=closes$closer);
g <- graph_from_data_frame( relations,directed=F, vertices=union(relations$from,relations$to))
group <- cluster_louvain( g )
membership <- membership(group)
g.d3 <- igraph_to_networkD3(g,group=membership)
forceNetwork(Links=g.d3$links,Nodes=g.d3$nodes,Source='source',Target='target',NodeID='name',Group='group') %>% saveNetwork(file = '../html/force-network-perl6-doc-issues.html')
sankeyNetwork(Links=g.d3$links,Nodes=g.d3$nodes,Source='source',Target='target',NodeID='name',nodewidth=30)
