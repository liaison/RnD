
library(ggplot2)
library(caret)

data(iris)

inTrain <- createDataPartition(y=iris$Species, p=0.7, list=FALSE)

training <- iris[inTrain,]
testing  <- iris[-inTrain,]

dim(training); dim(testing)

qplot(Petal.Width, Sepal.Width, colour=Species, data=training)
