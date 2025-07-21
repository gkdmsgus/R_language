rm(list = ls())
#7-10
head(iris)
order(iris$Sepal.Length)
iris[order(iris$Sepal.Length),]
iris[order(iris$Sepal.Length, decreasing = T),]
iris.new <- iris[order(iris$Sepal.Length),]
head(iris.new)
iris[order(iris$Species,-iris$Petal.Length,decreasing = T),]
#7-11
sp <- split(iris, iris$Species)
sp
summary(sp)
str(sp)
class(sp)
typeof(sp)
mode(sp)

sp$setosa
sp$virginica
sp$versicolor
sp[[1]]
sp[[2]]
sp[[3]]

#7-12
subset(iris, Species == "setosa")
subset(iris, Sepal.Length > 7.5)
subset(iris, Sepal.Length > 5.1 &
         Sepal.Length >3.9)
subset(iris, Sepal.Length > 7.6,
         select=c(Petal.Length,Petal.Width))
iris[1,]
iris[1]
iris[c(1,2)]
iris[colnames(iris)[1:2]]
iris[colnames(iris)[3:4]]
subset(iris, Sepal.Length > 7.6)[colnames(iris)[3:4]]

#7-13
x <- 1:100
y <- sample(x,size = 10, replace = FALSE)
y

#############연습#############
sample(1:10,10)
sample(1:5,6)
sample(1:5, 7, replace = TRUE)
##############################

#7-14
idx <- smaple(1:nrow(iris), size=50,
              replace = FALSE)
idx
iris.50 <- iris[idx,]
dim(iris.50)
head(iris.50)

#7-15
sample(1:20, size = 5)
sample(1:20, size = 5)
sample(1:20, size = 5)

set.seed(100)
sample(1:20, size = 5)
set.seed(100)
sample(1:20, size = 5)
set.seed(100)
sample(1:20, size = 5)

if(!require(dplyr)){
  install.packages("dplyr")
}
library(dplyr)

??sample_n
sample_n(iris,10)
sample_frac(iris)
sample_frac(iris, .1)
sample_frac(iris, .2)
