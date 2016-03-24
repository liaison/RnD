
#
#
#  Some examples to show how to use the APIs in the package dplyr.
#
library(dplyr)

#
#  load the data set
#
library(nycflights13)

dim(flights)

head(flights)



head(res)


############ data filtering 

# select the specific columns
res <- select(flights, origin, dest, carrier)


# exclude some columns
exclude_date <- select(flights, -(year:day), -(hour:minute))


str(exclude_date)

head(exclude_date)


# one can concatenate the conditions within the filter function.
filter(flights, month == 1 | day == 1, carrier=="UA")


############ data ordering

# sort the rows in place.
arrange(flights, dep_time)


























