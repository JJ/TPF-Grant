library("networkD3")
library("jsonlite")

data <- jsonlite::fromJSON("../data/issue-open-close-graph.json")
sankeyNetwork(Links = data$links, Nodes = data$nodes, Source = "source",
              Target = "target", Value = "value", NodeID = "name",
              NodeGroup = "group",
              units = "commits", fontSize = 12)
