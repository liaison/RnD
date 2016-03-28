# This is the example from the book <<R in action>> by Robert I. Kabacoff
# @date  Mars 28, 2016
# The code is used to rate the overall score of each student.

# keep two digits after the decimal point.
options(digits = 2)

# The data set.
Student <- c("John Davis", "Angela Williams", "Bullwinkle Moose",
             "David Jones", "Janice Markhammer", "Cheryl Cushing",
             "Reuven Ytzrhak", "Greg Knox", "Joel England",
             "Mary Rayburn")

Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)


roster <- data.frame(Student, Math, Science, English, stringsAsFactors = FALSE)

# scale all the scores so that they are comparable.
z <- scale(roster[, 2:4])

# calculate the mean of row
score <- apply(z, 1, mean)
roster <- cbind(roster, score)

# find the boundaries to divide the score list into 80%, 60%, 40% and 20%
y <- quantile(score, c(.8, .6, .4, .2))

# Assign the "grade" to each student, according to the quantile
roster$grade[score >= y[1]] <- "A"
roster$grade[score < y[1] & score >= y[2]] <- "B"
roster$grade[score < y[2] & score >= y[3]] <- "C"
roster$grade[score < y[3] & score >= y[4]] <- "D"
roster$grade[score < y[4]] <- "F"

# split the Student fields into names
name <- strsplit((roster$Student), " ")

# extract the field from the name vector
Lastname <- sapply(name, "[", 2)
Firstname <- sapply(name, "[", 1)

# add the Fristname and Lastname columns, remove the Student column
roster <- cbind(Firstname, Lastname, roster[, -1])

# sort the data, according to the Lastname and Firstname columns in ascending
roster <- roster[order(Lastname, Firstname), ]

# voila
roster


