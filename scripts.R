

# Function to calculate the fibonacci number
fibonacci <- function(n) {
  if(n == 0) return (1)

  fibonacci_rec(1, 1, n)
}


fibonacci_rec <- function(prev=1, acc=1, n=1) {
  if(n == 1) return (acc)
  else {
    fibonacci_rec(acc, acc+prev, n-1)
  }
}


###########################################
#           basic data structures 
###########################################


## vector
cells <- c(1, 2, 3, 4)
rnames <- c("R1", "R2")
cnames <- c("C1", "C2")



nums <- seq(1:100)

# exclude the first 5 elements
exclude.nums <- nums[-(1:5)]
exclude.nums

# the gap in the vector would be filled with NA (not available)
nums[102] <- 1
nums


# retrieve all the even number from a vector that contains NA.
even.nums <- nums[ !is.na(nums) & nums %% 2 == 0 ]
even.nums


# the indice of the elements start from one.
value1 <- cells[1]

## matrix
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=TRUE, dimnames=list(rnames, cnames))


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

# the reference of the columns/variables within a data frame.
col.status <- patientData[[2]]
col.status <- patientData$status


## factor (nomial or ordinal)

ordinal.status <- factor(status, order=TRUE)

# specify the order of the levels.
sex <- factor(c("male", "female"), order=TRUE, levels=c("female", "male"))

## List
# the data structure of list is more like the concept of tuple in other domains.

g <- "My first list"
h <- c(25, 26, 18, 39)
j <- matrix(1:10, nrow=5)
k <- c("one", "two", "three")

mylist <- list(title=g, ages=h, j, k)

# reference of elements within a data frame
elem.ages <- mylist[[2]]

elem.title <-mylist[["title"]]



###########################################
#             Data source 
###########################################

mydata <- data.frame(age=numeric(0), gender=character(0), weight=numeric(0))

# mydata <- edit(mydata)
# fix(mydata)

mydata.txt <- "
  age gender weight
  25 m 166
  30 f 115
  18 f 120
"

mydata <- read.table(header=TRUE, text=mydata.txt)







