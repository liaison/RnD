

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
abline(lm(mpg ~ wt))
title("Regression of MPG on Weight")
detach(mtcars)
dev.off()
################


# create a new canvas to draw the following graph.
# dev.new()



