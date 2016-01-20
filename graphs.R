
x <- seq(0, 1, 0.05)

# The entropy function for a two-class classification.
entropy <- - x * log(x) - (1-x) * log(1-x)

# The gini impurity function for a two-class classification.
gini_impurity <- 1 - x ^2 - (1-x) ^ 2

