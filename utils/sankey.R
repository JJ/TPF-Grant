library("networkD3")
library("jsonlite")

data <- jsonlite::fromJSON("../data/issue-open-close-graph.json")
sankeyNetwork(Links = data$links, Nodes = data$nodes, Source = "source",
             Target = "target", Value = "value", NodeID = "name",
             units = "TWh", fontSize = 12, nodeWidth = 30)
