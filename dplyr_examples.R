
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

# randomly select 10 elements from the data set.
sample_n(flights, 10)


############ data ordering ############ 

# sort the rows, by default, the asscending order.
sort_dep_time <- arrange(flights, dep_time)


# sort the arr_time row in the descending order.
sort_arr_time <- arrange(flights, desc(arr_time))


############  data transformation  ############ 

# add new columns to the origin ones.
new.dataset <- mutate(flights, gain = arr_delay - dep_delay, speed = distance / air_time * 60)



# keep only the new columns
transmute(flights, gain = arr_delay - dep_delay, speed = distance / air_time * 60)




############  statistics

# calculate the mean arrival delay time for each carrier.(remove the NA)
summarise(group_by(flights, carrier), mean(arr_delay, na.rm = TRUE))


#  x %>% f(y)  ==  f(x, y)
#  The syntax sugar from dplyr that shows the order of operation from left to right.

flights %>%
  group_by(year, month, day)  %>%
  select(arr_delay, dep_delay) %>%
  summarise(
    arr = mean(arr_delay, na.rm=TRUE),
    dep = mean(dep_delay, na.rm=TRUE)
  ) %>%
  filter(arr > 30 | dep > 30)


# The following statement is euivalent to the above one.
filter(
  summarise(
    select(
      group_by(flights, year, month, day),
      arr_delay, dep_delay
    ),

    arr = mean(arr_delay, na.rm=TRUE),
    dep = mean(dep_delay, na.rm=TRUE)
  ),

  arr > 30 | dep > 30
)







