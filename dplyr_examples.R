
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


############ data filtering 

# select the specific columns
res <- select(flights, origin, dest, carrier)


# exclude some columns
exclude_date <- select(flights, -(year:day), -(hour:minute))


str(exclude_date)

head(exclude_date)


# one can concatenate the conditions within the filter function.
filter(flights, month == 1 | day == 1, carrier=="UA")


# extract the distinct rows
tailnum <- distinct(select(flights, tailnum))

str(tailnum)



############ data ordering

# sort the rows, by default, the asscending order.
sort_dep_time <- arrange(flights, dep_time)


# sort the arr_time row in the descending order.
arrange(flights, desc(arr_time))



############  data transformation

# add new columns to the origin ones.
mutate(flights, gain = arr_delay - dep_delay, speed = distance / air_time * 60)


# keep only the new columns
transmute(flights, gain = arr_delay - dep_delay, speed = distance / air_time * 60)




############  statistics


summarise(, flights, mean(arr_delay))












