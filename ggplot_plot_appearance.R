# Plot Appearance
library(ggplot2)

## Layers
# Multiple Layers: + allow combine layers
df <- data.frame(px=rnorm(20), py=rnorm(20),
                 lx=seq(-1, +1, length.out=20))
df$ly <- df$lx^2

ggplot(df) +
  geom_point(aes(px, py)) +
  geom_line(aes(lx, ly))4
# Smoothing Layers
df <- data.frame(x=seq(0.5, 3, length.out=100))
df$y <- sin(df$x) + rnorm(100)
# linear trend
ggplot(df, aes(x, y)) +
  geom_point() +
  geom_smooth(method="lm") # Grey area represents 95% condifence interval

# local polynomial regression with smoothing param span
ggplot(df, aes(x, y)) +
  geom_point() +
  geom_smooth(method="loess", span=0.25)
ggplot(df, aes(x, y)) +
  geom_point() +
  geom_smooth(method="loess", span=0.75)

# Generalized additive model
ggplot(df, aes(x, y)) +
  geom_point() +
  geom_smooth(method="gam")


## Facets: display a grid of plots stemming from the same data
# Example with 1 group on x-axis
ggplot(mpg, aes(displ, hwy)) +
  geom_point(alpha=0.3) +
  facet_grid(. ~ year) # row ~ col
# Example with 2 groups on x- and y-axis
ggplot(mpg, aes(displ, hwy)) +
  geom_point(alpha=0.3) +
  facet_grid(cyl ~ year)


## Scales: control the look of axes, especially for continuous and discrete data
exp_growth <- data.frame(x=1:10, 
                         y=2^(1:10))
ggplot(exp_growth, aes(x,y)) +
  geom_point() +
  scale_y_log10() # from a curve to a line

ggplot(df, aes(x, y)) +
  geom_point() +
  coord_equal() # Forces the aspect ratio of the plot to be equal,
#ensuring that the units on the x and y axes are the same.

# Geometry Layout
head(mtcars)
ggplot(mtcars, aes(x=mpg, y=disp)) +
  geom_point(aes(size=hp, color=as.factor(cyl)))
# Scale Color Gradient: Color gradient stems from a range between two colors
points_continuous <- cbind(points, z=runif(20))
p <- ggplot(points_continuous) +
  geom_point(aes(x=x, y=y, color=z))
# scale_color_gradient
p + scale_color_gradient()
p + scale_color_gradient(low = "darkblue",
                         high="darkred")
# scale_color_hue: Requires source variable to be a factor
points_discrete <- cbind(points,
                         z=as.factor(sample(5, 20, replace = TRUE)))

p <- ggplot(points_discrete) +
  geom_point(aes(x=x, y=y, color=z))
p + scale_color_hue()
p + scale_color_hue(h=c(180, 270)) # set the range of hues in degrees

# scale_color_manual: Specifies colors for different groups manually
data_lines2 <- data.frame(x=c(1:10, 1:10),
                          var=c(rep("y1", 10), rep("y2", 10)),
                          y=c(rep(5,10), 11:20))
ggplot(data_lines2) +
  geom_line(aes(x=x, y=y, color=var)) +
  scale_color_manual(values=c("darkred", "darkblue"))

# Color Palettes: Built-in color palettes change color scheme
# discrete: brewer
pd <- ggplot(points_discrete) +
  labs(x="", y="") +
  geom_point(aes(x, y, color=z))
pd + scale_color_brewer() # default
pd + scale_color_brewer(palette="Set1") # intense color
# continuous: distiller
pc <- ggplot(points_continuous) + 
  labs(x="", y="") + 
  geom_point(aes(x, y, color=z))
pc + scale_color_distiller()
pc + scale_color_distiller(palette = "Spectral")

# Gray Scale Coloring
# Discrete
pd + scale_color_grey()
# Continuous
pc + scale_color_gradient(low="white", high="black")

# Ranges: crop plot to range
ggplot(df, aes(x, y)) +
  geom_point() +
  xlim(c(1,2))+
  ylim(c(-1,+1))


## Themes: themes further customize the appearance of plots
# print-friendly
ggplot(df, aes(x, y)) +
  geom_point() +
  theme_bw()
# can get more themes but need to download the package
library(ggthemes)
# labels via labs
ggplot(df, aes(x, y)) +
  geom_point() +
  labs(x = "x-axis" , y = "y-axis")


## Legends
