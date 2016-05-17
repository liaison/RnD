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

# This code snippet was grabbed from the course "R programming"
#  given by Johns Hopkins University in the site coursera.com

library(ggplot2)
library(caret)

# existing data set from R
data(iris)

inTrain <- createDataPartition(y=iris$Species, p=0.7, list=FALSE)

training <- iris[inTrain,]
testing  <- iris[-inTrain,]

dim(training); dim(testing)

# plot the data 
qplot(Petal.Width, Sepal.Width, colour=Species, data=training)

# train the model
modFit <- train(Species ~ ., method="rpart", data=training)

print(modFit$finalModel)

library(rattle)
fancyRpartPlot(modFit$finalModel)

predict(modFit, newdata=testing)

