
# 
# This script is an example on how to use ARIMA for time-series prediction.
#
# Date: Apr 10, 2017
#
# Reference:
#   https://www.analyticsvidhya.com/blog/2015/12/complete-tutorial-time-series-modeling/
#
#
#
data(AirPassengers)
class(AirPassengers)


plot(AirPassengers)

# draw the best-fit linear regression line 
abline(reg=lm(AirPassengers~time(AirPassengers)))

cycle(AirPassengers)


# plot the yearly mean
plot(aggregate(AirPassengers, FUN = mean))


# draw the monthly distribution
boxplot(AirPassengers ~ cycle(AirPassengers))


# export a time-serie dataset from R
library(zoo)
df <- data.frame(
  date=as.Date(as.yearmon(time(AirPassengers))), 
  Y=as.matrix(AirPassengers))
write.csv(df, "AirPassengers.csv")


# Dickey-Fuller test on the stationary
tseries::adf.test(diff(log(AirPassengers)), alternative = 'stationary', k=0)

acf(log(AirPassengers))

# ACF cut off after the first lag, therefore p = 0
acf(diff(log(AirPassengers)))

pacf(diff(log(AirPassengers)))


# set (p, d, q) as (0, 1, 1)
fit <- arima(log(AirPassengers), c(0,1,1), seasonal = list(order = c(0, 1, 1), period=12))

# predict for the next 10 years
pred <- predict(fit, n.ahead = 10 * 12)


ts.plot(AirPassengers, 2.718^ pred$pred, log='y', lty=c(1,3))


