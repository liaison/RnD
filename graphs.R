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

##
##
##  This script shows some examples on how to plot different kinds of graphs.
##
##

library(ggplot2)

############# 
# Compare the distribution of entropy and gini impurity functions which
#   are used in the decision tree algorithm.
############# 

x <- seq(0, 1, 0.05)

# The entropy function for a two-class classification.
entropy <- - x * log(x) - (1-x) * log(1-x)

# The gini impurity function for a two-class classification.
gini_impurity <- 1 - x ^ 2 - (1-x) ^ 2


# Plot the distribution of entropy first.
plot(x, entropy, type="l", col="red", 
	 xlab = "probability", ylab="Gini impurity / Entropy", lty=1, ylim=c(0, 0.7))

# Plot the gini_impurity further.
lines(x, gini_impurity, col="blue", lty=20)

legend(0.37, 0.25, c("Entropy", "Gini Impurity"),
	col=c("red", "blue"), lty=c(1, 20))


################
# save the grpah into pdf.
# Other than that, one can save it as png(), jpeg(), bmp() and postscript() etc.
pdf("mtcars.pdf")

attach(mtcars)

plot(wt, mpg)

# add labels to each point on the graph.
text(wt, mpg, row.names(mtcars), cex=.6, pos=4, col="red")

abline(lm(mpg ~ wt))
title("Regression of MPG on Weight")
detach(mtcars)
dev.off()
################


# create a new canvas to draw the following graph.
# dev.new()

# Retrieve the list of current parameters that can be modified.
oldPars <- par(no.readonly = TRUE)

dose  <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

# pin: the plot dimensions (width, height)
par(pin=c(2, 3))
par(lty=2, pch=17)

# plot 'both' the line and the dots.
plot(dose, drugA, type="b", col="red",
     lty=2,  # line style
     lwd=2,  # line width
     main="Clinical Trials for Drug A", # main title
     sub="This is hypothetical data",   # subtitle
     xlab="Dosage",
     ylab="Drug Response",
     xlim=c(20, 60),
     ylim=c(0, 70)
     )

# reset the parameters back 
par(oldPars)

# return the list of colors
# colors()

################


# increase line, text, symbol, and label size.
# par(lwd=2, cex=1.5, font.lab=2)

plot(dose, drugA, type="b",
     pch=15, lty=1, col="red", ylim=c(0, 60),
     main="Drug A vs. Drug B",
     xlab="Drug Dosage", ylab="Drug Response")

# draw another line on top of the above plot.
lines(dose, drugB, type="b",
      pch=17, lty=2, col="blue")


abline(h=c(30), lwd=1.5, lty=2, col="gray")

# add minor ticks along the axis
library(Hmisc)
minor.tick(nx=3, ny=3, tick.ratio=0.5)


legend("topleft", inset=.05, title="Drug Type",
       c("A", "B"), lty=c(1, 2), pch=c(15, 17), col=c("red", "blue"))

################
# Put multiple graphs into one layout
attach(mtcars)
oldPars <- par(no.readonly = TRUE)

# create a graph layout of 2 columns and 2 rows.
par(mfrow=c(2, 2))

plot(wt, mpg, main="Scatterplot of wt vs. mpg")
plot(wt, disp, main="Scatterplot of wt vs. disp")
hist(wt, main="Histogram of wt")
boxplot(wt, main="Boxplot of wt")

par(oldPars)

detach(mtcars)
################

# include the data set "arthritis"
library(vcd)

str(Arthritis)

counts <- table(Arthritis$Improved)

# the bar plots
barplot(counts, main="Simple Bar Plot",
        xlab = "Improvement", ylab = "Frequency")

# We could plot the 'factor' column directly, without the table() function.
plot(Arthritis$Improved, main = "Simple Bar Plot",
     xlab = "Improved", ylab = "Frequency")


barplot(counts, main="Simple Bar Plot", horiz = TRUE,
        ylab = "Improvement", xlab = "Frequency")

# stacked / grouped bar plots
counts <- table(Arthritis$Improved, Arthritis$Treatment)

counts
str(counts)

barplot(counts, main = "Stacked Bar Plot",
        xlab = "Treatment", ylab = "Frequency",
        col = c("red", "yellow", "green"),
        legend = rownames(counts))

barplot(counts, main = "Grouped Bar Plot",
        xlab = "Treatment", ylab = "Frequency",
        #col = c("red", "yellow", "green"),
        legend = rownames(counts), beside = TRUE)


################
# spinogram is the scaled bar plots.

attach(Arthritis)
another.counts <- table(Treatment, Improved)
spine(another.counts, main = "Spinogram Example")
detach(Arthritis)

################

# load the states information.
states <- data.frame(state.region, state.x77)

# calculate the mean illiteracy by the state.region group 
means <- aggregate(states$Illiteracy, by=list(state.region), FUN=mean)
means

# order the means by the result column x
means <- means[order(means$x),]

# plot the bars, with the given labels.
barplot(means$x,
        names.arg = means$Group.1, # specify the labels.
        cex.names =  0.8 # decrease the font size of labels
        )
# the following function is equivalent to the "main" attribute in barplot()
title("Mean Illiteracy Rate")

################
# pie charts
# set the layout to put 2*2 graphs
par(mfrow=c(2, 2))

slices <- c(10, 12, 4, 16, 8)
labels.country <- c("US", "UK", "Australia", "Germany", "France")

# pie chart with vectors
pie(slices, labels.country, col = rainbow(length(slices)),
    main = "Simple Pie Chart")

percentage <- round(slices / sum(slices) * 100)
percentage

# pie chart with percentage labels
labels.percentage <- paste(labels.country, " ", percentage, "%", sep="")
pie(slices, labels=labels.percentage,
    main = "Pie Chart with Percentage")

# 3D pie chart
library(plotrix)
pie3D(slices, labels=labels.percentage, explode=0.2,
      main = "3D Pie Chart", labelcex = 0.9)

# create a pie chart out of a table
pie.table <- table(state.region)
str(pie.table)
pie.labels <- paste(names(pie.table), "\n", pie.table, sep="")

pie(pie.table, labels = pie.labels,
    main= "Pie Chart from a Table\n (with sample sizes)")

######
# a special pie chart from plotrix package
fan.plot(slices, labels = labels.country, main = "Fan Plot")



################
##  histogram ##
################

mtcars$mpg

par(mfrow=c(2,2))
# simple histogram
hist(mtcars$mpg)

# histogram with specified bins and color
hist(mtcars$mpg,
     breaks=12,
     col="red",
     xlab="Miles Per Gallon",
     main="Colored histogram with 12 bins")


# histogram with a rug plot
hist(mtcars$mpg,
     freq=FALSE,
     breaks=12,
     col="red",
     xlab="Miles Per Gallon",
     main="Histogram, rug plot, density curve")
rug(jitter(mtcars$mpg))
lines(density(mtcars$mpg), col="blue", lwd=2)


# with a normal curve and frame
x <- mtcars$mpg
h <- hist(x,
          breaks=12,
          col="red",
          xlab="Miles Per Gallon",
          main="Histogram with normal curve and box")

xfit <- seq(min(x), max(x), length=40)
yfit <- dnorm(xfit, mean=mean(x), sd=sd(x))
yfit <- yfit * diff(h$mids[1:2]) * length(x)
lines(xfit, yfit, col="blue", lwd=2)
box()






