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



##############################
# simple regression

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
# Add a quadratic (power 2) to the whole polynomial term.
fit2 <- lm(weight ~ height + I(height ^ 2), data = women)

# The significance of the squared term (t=13.89) suggests that the inclusion of
#  the quadratic term improves the model fit.
# Indeed, as it shows in the following graph, the fitting line is more smooth.
summary(fit2)


plot(women$height, women$weight,
     xlab="Height (in inches)",
     ylab="Weight (in pounds)")

lines(women$height, fitted(fit2))


##############################

library(car)

# the loess fit is rendered as dashed line (lty=2)
# the pch=19 option displays points as filled circles (default: open circle)
scatterplot(weight ~ height, data=women,
            spread=FALSE, smoother.args=list(lty=2), pch=19,
            main="Women Age 30 - 39",
            xlab="Height (inches)",
            ylab="Weight (lbs.)")



##############################
# multiple linear regression:  regression invovles multiple variables
str(state.x77)
head(state.x77)

states <- as.data.frame(state.x77[, c("Murder", "Population",
                                      "Illiteracy", "Income", "Frost")])

# the bivariate correlations
cor(states)

library(car)
scatterplotMatrix(states, spread=FALSE, smoother.args = list(lty=2),
                  main="Scatter Plot Matrix")

# from the correlation table and the scatter plot, we could tell:
# 1). Murder rates rise with population and illiteracy.
# 2). Murder rates fall with higher income levels and frost
# 3). Colder states have lower illiteracy rates and population and higher income.






