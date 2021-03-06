# Attempt to create Sankey Plot

library(dplyr)
library(readr)
read_csv("./Data/p1.csv") %>% # read csv for node names
  data.frame() -> nodes

read_csv("./Data/p2.csv") %>% # read csv for links
  data.frame() -> links
links$Value = as.numeric(links$Value) # make "Values" column in links numeric
testsan = list(nodes = nodes, links = links) # create list containing node and list data (named)
library(networkD3)
sankeyNetwork(Links = testsan$links, Nodes = testsan$nodes, Source = "Source",
              Target = "Target", Value = "Value", NodeID = "name",
              units = "AF", fontSize = 12, nodeWidth = 30)

# I don't get an error message, just nothing appears

# Original Energy Sankey Plot
# sankeyNetwork(Links = Energy$links, Nodes = Energy$nodes, Source = "source",
#               Target = "target", Value = "value", NodeID = "name",
#               units = "TWh", fontSize = 12, nodeWidth = 30)
