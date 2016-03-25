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

legend(0.32, 0.25, c("Entropy", "Gini Impurity"),
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





