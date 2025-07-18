#5-1
favorite <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
              'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')
favorite
table(favorite)
table(favorite)/length(favorite)
#5-2
ds <-  table(favorite)
ds
barplot(ds, main = 'favorite season')
#5-3
ds <-  table(favorite)
ds
pie(ds, main = 'favorite season')
#5-4
favorite.color <- c(2,3,2,1,1,2,2,1,3,2,1,3,2,1,2)
ds <- table(favorite.color)
ds
barplot(ds, main='favorite color')
colors <- c('green','red','blue')
names(ds) <- colors
ds
barplot(ds,main = 'favorite color', col=colors)
pie(ds, main = 'favorite color', col=colors)


gender <- c("male", "female", "female", "male","female")

gender_factor <-factor(gender)
print(gender_factor)
levels(gender_factor)

size <- c("small","large", "mediun", "small","large")
size_factor <- factor(size, levels = c("small", "mediun","large"))
print(size_factor)
levels(size_factor)
nlevels(size_factor)
class(size_factor)


