# code 7-17
agg <- aggregate(iris, by=list(iris$Species), 
                 FUN=mean)
agg

agg <- aggregate(iris[,-5], by=list(iris$Species), 
                 FUN=mean)
agg

# code 7-18
agg <- aggregate(iris[,-5], by=list(표준편차=iris$Species),
                 FUN=sd)
agg

# code 7-19
head(mtcars)
agg <- aggregate(mtcars, 
                 by=list(cyl=mtcars$cyl, vs=mtcars$vs),
                 FUN=max)
agg

# code 7-20
x <- data.frame(name=c("a","b","c"), math=c(90,80,40))
y <- data.frame(name=c("a","b","d"), korean=c(75,60,90))
x
y

# code 7-21
z <- merge(x,y, by=c("name"))
z

z <- merge(x,y)
z

# code 7-22
merge(x,y, all.x=T)   # 첫 번째 데이터셋의 행들은 모두 표시되도록
merge(x,y, all.y=T)   # 두 번째 데이터셋의 행들은 모두 표시되도록
merge(x,y, all=T)     # 두 데이터셋의 모든 행들이 표시되도록

# code 7-23
x <- data.frame(name=c("a","b","c"), math=c(90,80,40))
y <- data.frame(sname=c("a","b","d"), korean=c(75,60,90))
x                         # 병합 기준 열의 이름이 name
y                         # 병합 기준 열의 이름이 sname

merge(x,y, by.x=c("name"), by.y=c("sname"))
merge(x,y, by.x=c("name"), by.y=c("sname"), all.x=T)   # 첫 번째 데이터셋의 행들은 모두 표시되도록
merge(x,y, by.x=c("name"), by.y=c("sname"), all.y=T)   # 두 번째 데이터셋의 행들은 모두 표시되도록
merge(x,y, by.x=c("name"), by.y=c("sname"), all=T)     # 두 데이터셋의 모든 행들이 표시되도록


# example code
## Compute the averages for the variables in 'state.x77', grouped
## according to the region (Northeast, South, North Central, West) that
## each state belongs to.
head(state.x77)
str(state.x77)
colnames(state.x77)
state.region

aggregate(state.x77, list(Region = state.region), mean)

## Compute the averages according to region and the occurrence of more
## than 130 days of frost.
aggregate(state.x77,
          list(Region = state.region,
               Cold = state.x77[,"Frost"] > 130),
          mean)
## (Note that no state in 'South' is THAT cold.)


## example with character variables and NAs
testDF <- data.frame(v1 = c(1,3,5,7,8,3,5,NA,4,5,7,9),
                     v2 = c(11,33,55,77,88,33,55,NA,44,55,77,99) )
by1 <- c("red", "blue", 1, 2, NA, "big", 1, 2, "red", 1, NA, 12)
by2 <- c("wet", "dry", 99, 95, NA, "damp", 95, 99, "red", 99, NA, NA)
aggregate(x = testDF, by = list(by1, by2), FUN = "mean")

# and if you want to treat NAs as a group
fby1 <- factor(by1, exclude = "")
fby2 <- factor(by2, exclude = "")
aggregate(x = testDF, by = list(fby1, fby2), FUN = "mean")


## Formulas, one ~ one, one ~ many, many ~ one, and many ~ many:
aggregate(weight ~ feed, data = chickwts, mean)
aggregate(breaks ~ wool + tension, data = warpbreaks, mean)
aggregate(cbind(Ozone, Temp) ~ Month, data = airquality, mean)
aggregate(cbind(ncases, ncontrols) ~ alcgp + tobgp, data = esoph, sum)

## "complete cases" vs. "available cases"
colSums(is.na(airquality))  # NAs in Ozone but not Temp
## the default is to summarize *complete cases*:
aggregate(cbind(Ozone, Temp) ~ Month, data = airquality, FUN = mean)
## to handle missing values *per variable*:
aggregate(cbind(Ozone, Temp) ~ Month, data = airquality, FUN = mean,
          na.action = na.pass, na.rm = TRUE)

## Dot notation:
aggregate(. ~ Species, data = iris, mean)
aggregate(len ~ ., data = ToothGrowth, mean)

## Often followed by xtabs():
ag <- aggregate(len ~ ., data = ToothGrowth, mean)
xtabs(len ~ ., data = ag)

## Formula interface via 'by' (for pipe operations)
ToothGrowth |> aggregate(len ~ ., FUN = mean)

## Compute the average annual approval ratings for American presidents.
aggregate(presidents, nfrequency = 1, FUN = mean)
## Give the summer less weight.
aggregate(presidents, nfrequency = 1,
          FUN = weighted.mean, w = c(1, 1, 0.5, 1))
[Package stats version 4.3.2 I

