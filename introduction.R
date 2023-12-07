x <- 1:100
y <- cumsum(x)
y
plot(x, y)
3*(4+2)
0/0
3<4
4==4
3==4
sqrt(2)
log2(4)
z <- sin(pi)
plot(z)
# Vector
vec1 <- numeric(3)
ve2 <- numeric(4)
# concatenated through c(,,,)
vec <- c(vec1, ve2)
# Access index (not 0 based index)
vec[1]
# Subset
vec[1] <- 2
vec[c(1,2)]
# Length
length(vec)
# Repeat
rep(2, 5)
rep(c(1,3), 5)
# Average, variance, sum
test1 <- c(3,4,6,25,34,57,35,2)
mean(test1)
var(test1)
sum(test1)
# Standard Deviation
x <- c(1,4,9)
sqrt(var(x))
sd(x)
# Generating Sequence
vec <- 1:5
vec1 <- seq(1,5, 0.2)
sum(1:100)
# Generate Matrices by combining vectors Dataframe
height <- c(163, 186, 172)
shoe_size <- c(39, 44, 41)
m <- as.data.frame(cbind(height, shoe_size))
head(m)
# Read csv file
d <- as.data.frame(read.csv(file.choose()), header=TRUE, spe=", ")
# Show first 6 rows
head(d)
# Show column names
str(d)
# Access columns by name
d$age
d[["age"]]
# Accessing individual element (row, column)
d[1,2]
# Using condition to select a subset of rows
d[d$height > 180, ]
# Using several condition
d[d$height > 180 & d$age > 25, ]
d[d$age == 26 | d$shoesize == 45, ]
# Adding columns
d[["heightInInch"]] <- d$height/2.51
# Get column name
colnames(d)
# Update column names
colnames(d) <- c("name", "waist", "weight", "shoes", "books")
# fucntion
f <- function(a,b) {
  print(c(a, b))
}
f(-1, 5)
# For
for (i in 4:7) {
  print(i)
}
e <- c()
for(i in 1:3){
  e[i] <- sqrt(i)
}
e
# while
z <- 1
while (z <= 4){
  print(z)
  z <- z+1
}
help("summary")
summary(d)
