
x <- seq(0, 1, 0.05)

# The entropy function for a two-class classification.
entropy <- - x * log(x) - (1-x) * log(1-x)

# The gini impurity function for a two-class classification.
gini_impurity <- 1 - x ^ 2 - (1-x) ^ 2


# Plot the distribution of entropy first.
plot(x, entropy, type="l", col="red", 
	 xlab = "probability", ylab="Gini impurity / Entropy", lty=1)

# Plot the gini_impurity further.
lines(x, gini_impurity, col="blue", lty=20)

legend(0.01, 0.7, c("Entropy", "Gini Impurity"),
	col=c("red", "blue"), lty=c(1, 20))

