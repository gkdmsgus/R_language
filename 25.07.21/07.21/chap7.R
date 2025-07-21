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
