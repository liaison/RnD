#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

library(dplyr)

# set the precision of numeric calculation
options(digits=5)

input <- read.csv("data/page_rank.csv",
                  comment.char = "#",
                  sep=",",
                  strip.white = TRUE, # strip the white space between separator
                  stringsAsFactors = TRUE)


# The result of the page_rank algorithm is actually 
#   the result of a markov chain process.

# If we represent the graph as the the square matrix,
#   then the result of page rank is actually 
#   the eigenvalues * eigenvector of the matrix ? 


# Order the matrix by node.
graph <- input[order(input$Node),]
graph

# get the set of nodes
nodes.set <- union(graph$Node, graph$Neighbor)
nodes.set


# damping factor: the possibility that users navigate from one page to another.
# i.e.the possibility that users stay on the current page is (1-damping.factor)
damping.factor <- 0.85


# set the initial value of the page ranking value as 1.
# And index the rows with the name of the node.
page.rank.score <- data.frame(Node = nodes.set,
                              Score = 1,
                              row.names = nodes.set)

# count the number of neighbors for each node.
neighbor.count <-
  summarise(group_by(graph, Node), Neighbors = length(Neighbor))

# Merge the above fields
page.rank <- merge(page.rank.score, neighbor.count, all.x = TRUE)
row.names(page.rank) <- nodes.set
page.rank


plot(page.rank$Score,
     ylim=c(0, 1),
     xlab = "Nodes",
     ylab = "PageRank Score",
     pch = 1,
     type = "n",
     # remove the numbering on X axis.
     xaxt = "n",
     main = "Converge of Page Ranking")

# add minor ticks to the Y axis
library(Hmisc)
minor.tick(ny=5, nx=1)

# Draw the customized X axis, on the bottom (1)
axis(1, at=page.rank$Node,labels=page.rank$Node)


while(TRUE) {

  contrib.score <- rep(0, times=length(nodes.set))
  # index the element with the node names
  names(contrib.score) <- nodes.set

  # calculate the contributions of each node to its neighbors.
  for(i in 1:nrow(graph)) {
    node <- graph[i, "Node"]
    neighbor <- graph[i, "Neighbor"]

    contrib <-
      page.rank[node, "Score"] * damping.factor / page.rank[node, "Neighbors"]
    
    contrib.score[neighbor] <- contrib.score[neighbor] + contrib 
  }

  init.score <- (1-damping.factor) / length(nodes.set)

  new.score <- init.score + contrib.score

  print(page.rank)

  # plot the new values
  points(page.rank$Score, col="red")

  if (all(page.rank$Score == new.score)) {
    break
  } else {
    page.rank$Score <- new.score
  }
}



