
if(!require(treemap)){
  install.packages("treemap")
}
library(treemap)
#8-1
data(GNI2014)
head(GNI2014)
treemap(GNI2014,
        index=c("continent","iso3"),
        vSize="population",
        vColor = "GNI",
        type = "value",
        title = "World's GNI")
#8-2
st <- data.frame(state.x77)
st <- data.frame(st, stname=rownames(st))

treemap(st,
        index = c("stname"),
        vSize = "Area",
        vColor = "Income",
        type = "value",
        title = "USA states area and income")
#8-3
st <- data.frame(state.x77)
symbols(st$Illiteracy,st$Murder,
        circles = st$Population,
        inches = 0.3,
        fg = "white",
        bg = "lightgray",
        lwd=1.5,
        xlab = "rate of Illiteracy",
        ylab = "crime(murder) rate",
        main = "Illiteracy and Crime")
text(st$Illiteracy,st$Murder,
     rownames(st),
     cex = 0.6,
     col = "brown")
#8-4
head(mtcars)
mosaicplot(~gear+vs, data = mtcars, color=TRUE,
           main = "Gear and Vs")

#5교시
#table로 바로 모자이크 그리기
mosaicplot(~vs+ gear, data = mtcars, color=TRUE,
           main="Gear and Vs")
tab <- table(mtcars$vs,mtcars$gear)
tab
str(tab)
mosaicplot(~vgear+ vs, data = mtcars, color=TRUE,
           main="Gear and Vs")
tab <- table(mtcars$gear,mtcars$vs)
tab
mosaicplot(tab,color=TRUE,
           main = "Gear and Vs")

#table 직접생성
t <- table(c(1,2,3,1,1,3,3,3,1,2))
t
str(t)

mytab <- structure(
  c(2,3,1,4),
  dim= c(2,2),
  dimnames=list(
    Gender = c("Male","female"),
    Result = c("Pass","Fail")
  ),
  class = "table"
)
mytab
str(mytab)
class(mytab)

mat <- matrix(c(5,7,6,8), nrow = 2,
              dimnames = list(c("A","B"),c("X","Y")))
class(mat) <- "table"
mat
str(mat)
class(mat)

tab3d <- array(
  c(1:8),
  dim = c(2,2,2),
  dimnames = list(
    Gender = c("M","F"),
    Result = c("Yes", "No"),
    Group = c("G1", "G2")
  )
)
class(tab3d) <- "table"
tab3d
str(tab3d)
class(tab3d)

#8-5
library(ggplot2)

mpg
str(mpg)
#homepage code
ggplot(mpg,aes(displ,hwy,colour = class))+
  geom_point()
str(mpg)
#ggplot2 철학
#데이터 +
#미학적 맵핑(aesthetic mapping)
#기하적 객체(geometric objects)
ggplot(mpg, aes(displ, hwy, colour = drv)) +
  geom_point()

month <- c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month,rain)
df

ggplot(df, aes(x=month,y=rain))+
  geom_bar(stat = "identity",
           width = 0.7,
           fill = "steelblue")
#8-6
ggplot(df,aes(x=month,y=rain))+
  geom_bar(stat = "identity",
           width = 0.7,
           fill="steelblue")+
  ggtitle("월별 강수량")+
  theme(plot.title = element_text(size = 20,face = "bold",colour = "steelblue"))+
  labs(x="월",y="강수량")+
  coord_flip()

ggplot(df,aes(x=month,y=rain))+
  geom_bar(stat = "identity",
           width = 0.7,
           fill="wheat")+
  ggtitle("월별 강수량")+
  theme(plot.title = element_text(size = 20,face = "bold",colour = "steelblue"))+
  labs(x="월",y="강수량")

ggplot(df,aes(x=month,y=rain))+
  geom_bar(stat = "identity",
           width = 0.7,
           fill="steelblue")+
  ggtitle("월별 강수량")+
  theme(plot.title = element_text(size = 20,face = "bold",colour = "steelblue"),
        axis.title.y = element_text(angle = 0,vjust = 0.5))+
  labs(x="월",y="강수량")+
  coord_flip()

#8-7
ggplot(iris, aes(x=Petal.Length))+
  geom_histogram(binwidth = 0.5)

ggplot(iris, aes(x=Petal.Length))+
  geom_histogram(binwidth = 1)

range(iris$Petal.Length)

dev.off()
par(mfrow= c(1,2))
ggplot(iris, aes(x=Petal.Length))+
  geom_histogram(binwidth = 0.5)

ggplot(iris, aes(x=Petal.Length))+
  geom_histogram(binwidth = 1)
par(mfrow=c(1,1))

#8-8
range(iris$Sepal.Width)

ggplot(iris,aes(x=Sepal.Width, fill=Species,color=Species))+
  geom_histogram(binwidth = 0.5, position = "dodge")+
  theme(legend.position = "top")

ggplot(iris,aes(x=Sepal.Width, fill=Species,color=Species))+
  geom_histogram(binwidth = 0.5, position = "stack")+
  theme(legend.position = "top")
########################################
#ggplot은 위 방법으로 안되고 다음으로 처리
if(!require("gridExtra")){
  install.packages("gridExtra")
}
library(gridExtra)
g1 <- ggplot(iris,aes(x=Sepal.Width, fill=Species,color=Species))+
  geom_histogram(binwidth = 0.5, position = "dodge")+
  theme(legend.position = "top")
g2 <- ggplot(iris,aes(x=Sepal.Width, fill=Species,color=Species))+
  geom_histogram(binwidth = 0.5, position = "stack")+
  theme(legend.position = "top")

#플롯 배열, 2행 1열로 그리기
grid.arrange(g1,g2,nrow = 1, ncol=2)
