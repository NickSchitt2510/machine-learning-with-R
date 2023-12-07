d <- read.csv(file.choose())
# Plot the data
plot(d$height, d$age)
# Add title, table, and annotations
plot(d$height, d$age,
     main="People's Height and Age",               # OVERALL TITLE
     xlab="Height", ylab="Age")  # TITLES FOR X AND Y AXIS
text(d$height, d$age, d$name)    # D$NAME ARE LABLES
# Line plot
x <- seq(1:50)
plot(x, x*x)
plot(x, x*x, type="l") # type = l not 1

x1 <- seq(-1,+1, 0.01)
plot(x1, abs(x1), type="l",
     xlab="", ylab="")
# Histograms with Frequencies
hist(d$height, xlab="Height")
b <- c(0,150,175,200)
hist(d$height, breaks=b,xlab="Height")
# Boxplot
boxplot(d$height, horizontal = TRUE,xlab="Height")
boxplot(d$height, horizontal = TRUE,xlab="Height", range=0)
hist(d$height, freq=FALSE)
# Overlap
xx <- seq(min(d$height), max(d$height), 0.01)
lines(xx, dnorm(xx, mean=mean(d$height),sd=sd(d$height)))
##  QQ plot
qqnorm(d$height)
qqline(d$height)

