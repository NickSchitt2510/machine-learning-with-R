library(ggplot2)
# ggplot2 example
line_data <- data.frame(year=1900:2000, price=1:101)
ggplot(line_data, aes(x=year, y=price)) + geom_line()
# Conversion between long and wide data
d_wide <- data.frame(Company = c("A", "B", "C"), SalesDrinks = c(300, 200, 50),
                     SalesFood = c(400, 100, 0))
library(reshape2)
melt(d_wide, id.vars = "Company")
# Plot types: scatter plot
points <- data.frame(x=rnorm(20), y=rnorm(20))
p1 <- ggplot(points, aes(x, y)) + geom_point()
p1
p2 <- ggplot(points, aes(x, y)) + geom_point(alpha=0.7, color="darkblue",  shape = 0)
p2
colnames(mpg)
ggplot(mpg, aes(x=displ, y=hwy)) +
  geom_point(aes(size=cyl, fill=drv), shape=21)
# Plot types: line plot
x <- seq(0,2*pi, by=0.01)
data_sin_cos <- data.frame(x=x, sin=sin(x), cos=cos(x))
ggplot(data_sin_cos, aes(x)) +
  geom_line(aes(y=sin)) +
  geom_line(aes(y=cos), color="darkred", linetype="longdash")
# Draw two line: use var to divide group
data_lines2 <- data.frame(x=c(1:10, 1:10),
                          var=c(rep("y1", 10), rep("y2", 10)),
                          y=c(rep(5,10), 11:20))
ggplot(data_lines2) +
  geom_line(aes(x=x, y=y, group=var, color=var))
# Plot types: area chart
# stacks the areas on top of each other
ggplot(data_lines2) +
  geom_area(aes(x=x, y=y, fill=var, group=var), position="stack")
# relative values for each group out of 100%
ggplot(data_lines2) +
  geom_area(aes(x=x, y=y, fill=var, group=var), position="fill")
# Plot types: bar chart
grades_freq <- data.frame(grade=c("good", "fair", "bad"),
                          freq=c(3,2,5))
ggplot(grades_freq) +
  geom_bar(aes(grade,freq), stat="identity")
# automatically counts the frequency of observations
grades <- data.frame(grade=c("good", "good", "good", "fair", "fair",
                             "bad", "bad", "bad",
                             "bad", "bad"))
ggplot(grades) +
  geom_bar(aes(grade), stat="count")
# Stacked bar chart
summary(diamonds)
head(diamonds)
ggplot(diamonds) +
  geom_bar(aes(x=color, fill=cut), stat = "count")
# Grouped bar chart
ggplot(diamonds) +
  geom_bar(aes(x=color, fill=cut), stat = "count", position="dodge")
# Histogram
head(points)
ggplot(points) +
  geom_histogram(aes(x), binwidth = 0.1, fill="steelblue", color="black")
# Y as density
ggplot(points) +
  geom_histogram(aes(x, y=..density..), binwidth = 0.1, fill="steelblue", color="black")
# Box Plot
height <- data.frame(gender=c(rep("m", 100), rep("f", 100)), 
                     height=c(rnorm(100,mean=175), rnorm(100, mean=172)))
ggplot(height) +
  geom_boxplot(aes(gender, height))
# Density Plot (smooth alternative of a histogram)
ggplot(height) +
  geom_density(aes(x=height, fill=gender), stat = "density", alpha=0.6)
