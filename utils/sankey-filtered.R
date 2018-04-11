library("networkD3")
library("igraph")

data <- read_graph("../data/issue-open-close-graph.net",format="pajek")
filtered <- delete.edges(data, which(E(data)$weight <=1)) 
smaller <- delete.vertices(filtered,which(degree(filtered)<1))
issues <-  igraph_to_networkD3(smaller)
sn <- sankeyNetwork(Links = issues$links, Nodes = issues$nodes, Source = "source",
              Target = "target", Value = "value", NodeID = "name",
              units = "commits", fontSize = 20, nodeWidth=30)
sn %>% saveNetwork( file= '../html/sankey.html' )
