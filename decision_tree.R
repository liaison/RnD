
# from the course "R programming" given by Johns Hopkins University in the site coursera.com

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

