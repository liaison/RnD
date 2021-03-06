#
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
#
# This script is intended to be "learning R in 5 minutes" show-case program.
#
#  It could teach a developer to quickly load (boottrap) the syntax rules 
#    of R into mind.
#
#


###########################################
#           basic data structures 
###########################################

## Note: it is sort of a convention to name the variables
#   in the format of x.y.z... in R.


## vector
#  C(...) is a function that creates a vector out of a list of literals.
cells <- c(1, 2, 3, 4)


# Retrieve the element with the number index
# the indice of the elements start from one.
cells.elem1 <- cells[1]


# index each elements with a label, so we could refer to them with a name,
#  instead of the position index.
cells.index <- c("A", "B", "C", "D")
names(cells) <- cells.index
cells

# they are referring to the same element.
cells[1] == cells["A"]


# create a sequence (vector), with a given step length.
nums <- seq(from=1, to=100, by=1)

# exclude the first 5 elements
exclude.nums <- nums[-(1:5)]
exclude.nums

# truncate the vector 
length(nums) <- 90

# the gap in the vector would be filled with NA (not available)
nums[102] <- 1
nums


# Get a vector of boolean value indicating the result of comparision
#   for each element.
na.vec <- is.na(nums)
na.vec

# retrieve all the even number.
# Here we retrieve the corresponding elements with a boolean vector.
even.nums <- nums[ !is.na(nums) & nums %% 2 == 0 ]
even.nums


matrix.rnames <- c("R1", "R2")
matrix.cnames <- c("C1", "C2")

## matrix
# by default, the matrix is constructed by column.
mymatrix <- matrix(cells, nrow=2, ncol=2, 
                   byrow=TRUE, dimnames=list(matrix.rnames, matrix.cnames))

# show attributes that are associated with an object.
attributes(mymatrix)
# one can change the value of a specific attribute with 
#   attr(obj, attrName) <- value

dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")

## array
z <- array(1:24, c(2, 3, 4), dimnames=list(dim1, dim2, dim3))

## data frame

patientID <- c(1:4)

status <- c("Poor", "Improved", "Excellent", "Poor")

patientData <- data.frame(patientID, status)

# describe the structure of the data frame.
str(patientData)

# the reference of the columns within a dataframe either by index or name.
col.status <- patientData[[2]]
col.status <- patientData$status
col.status

## factor (nomial or ordinal)

ordinal.status <- factor(status, order=TRUE)

# specify the order of the levels.
sex <- factor(c("male", "female"), order=TRUE, 
              levels=c("female", "male"))

## List
# the data structure of list is more like 
#   the concept of tuple in other domains.

g <- "My first list"
h <- c(25, 26, 18, 39)
j <- matrix(1:10, nrow=5)
k <- c("one", "two", "three")

mylist <- list(title=g, ages=h, j, k)

# reference of elements within a data frame
elem.ages <- mylist[[2]]

elem.title <-mylist[["title"]]


###########################################
#      basic data type conversion 
###########################################

# an empty numeric vector
emptyNum <- numeric()
emptyNum

# create a sequence (vector) of numbers.
z <- 0:9
z

# convert the integer into character
digits <- as.character(z)
digits

# some string / characters operation
str <- c("abc")
str

toupper(str)

nchar(str) == 3

substr(str, 1, 2) <- "ef"
str

grep("A", c("adddAe", "BEC", "KDDDa"), ignore.case = TRUE)

# paste two vectors together with the separator.
paste("x", 1:3, sep=":")


name <- "Bob"
# concatenate the strings to the console or file (file="file.path")
cat("Hello, ", name)


# convert the character into integer
ints <- as.integer(digits)
ints



# Convert the string into date.
# the default format of date is: yyyy-mm-dd
defaultDate <- as.Date("2016-03-23")
defaultDate
class(defaultDate)


# any date string with different formats, needs to be specified.
mydate <- as.Date(c("03/23/2016"), "%m/%d/%Y")
mydate
class(mydate)

# convert the date into string/characters
mydate.str <- as.character(mydate)
mydate.str
class(mydate.str)


today <- Sys.Date()

date.str <- format(today, "%B %d %Y")
date.str

days.diff <- today - mydate
days.diff

difftime(today, mydate, units="weeks")


###########################################
#           math functions
###########################################

x <- 1:8

mx <- mean(x)
mx

# the length / size of a vector
n <- length(x)

css <- sum((x-mx)^2)

std.deviation <- sqrt( css / (n-1) )
# standard deviation
std.deviation == sd(x)


x.scaled <- scale(x)
# manually do the scaling (normalization, z-scores)
x.manual.scale <- (x - mean(x)) / sd(x)
x.scaled == x.manual.scale



new.std.deviation <- 1
new.mean <- 0

# To scale each column to an arbitrary mean and standard deviation, 
#   one can apply the following formulas
newx <- scale(x) * std.deviation + new.mean
newx
str(newx)

###########################################
#             Control flow 
###########################################

# looping statements

for(i in 1:3) print("Hello world.")

i <- 3
while(i > 0) { print("Hello world."); i <- i - 1 }

# conditional statements
# if(cond) statement1 else statement2
# ifelse(cond, statement1, statement2)

feelings <- c("sad", "afraid")
for( i in feelings)
  print(
    switch(i,
      happy = "I am glad you are happy",
      afraid = "There is nothing to fear",
      sad = "Cheer up",
      angry = "Calm down now"
    )
  )

###########################################
#             Data source 
###########################################

mydata <- data.frame(age=numeric(0),
                     gender=character(0),
                     weight=numeric(0))

# edit the values of a data frame with the following APIs.
# mydata <- edit(mydata)
# fix(mydata)


mydata.txt <- "
  age gender weight
  25 m 166
  30 f 115
  18 f 120
"

mydata <- read.table(header=TRUE, text=mydata.txt)
mydata


###########################################
#           statistic functions 
###########################################
library(vcd)

# frequency counts with the table() function
mytable <- with(Arthritis, table(Improved))

# turn the frequencies into proportions
prop.table(mytable)


library(gmodels)
CrossTable(Arthritis$Treatment, Arthritis$Improved)







