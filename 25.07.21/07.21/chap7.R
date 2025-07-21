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
sp$setosa
