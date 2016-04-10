
#######################
#  Regression Models
#######################

# methodologies

#  predict "response" (dependent) variable from one or more "predictor"
#    (independent/explanatory) variables.

# OLS (ordinary least squares) regression, the regression models that
#    minimize the sum of square residuals
#   (difference between predicted value and actual value)

# e.g:
# Simple linear regression, polynomial regression and multiple linear regression


fit <- lm(weight ~ height, data=women)

summary(fit)

women$weight

# get predicted value for all the samples involved in the model.
fitted(fit)

# get the residual values
residuals(fit)


plot(women$height, women$weight,
     xlab="Height (in inches)",
     ylab="Weight (in pounds)")

abline(fit)

# I() function wraps/escapes the arithmetical operators.
fit2 <- lm(weight ~ height + I(height ^ 2), data = women)

summary(fit2)


plot(women$height, women$weight,
     xlab="Height (in inches)",
     ylab="Weight (in pounds)")

lines(women$height, fitted(fit2))










