#11-1 
head(cars)
plot(dist~speed, data = cars)
 
model <-  lm(dist~speed, cars)
model
 
abline(model)
coef(model)[1]
coef(model)[2]
#11-2
b <- coef(model)[1]
W <- coef(model)[2]