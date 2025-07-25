# 이전 메모리 제거
rm(list = ls())

# code 7-11
sp <- split(iris, iris$Species)   # 품종별로 데이터 분리
sp                                # 분리 결과 확인
str(sp)
is.list(sp)
summary(sp)                       # 분리 결과 요약

sp$setosa                         # setosa 품종의 데이터 확인
sp$virginica                      # virginica 품종의 데이터 확인
sp$versicolor                     # versicolor 품종의 데이터 확인
is.data.frame(sp$setosa)

# code 7-12
subset(iris, Species == "setosa")
subset(iris, Sepal.Length > 7.5)
subset(iris, Sepal.Length > 5.1 & Sepal.Width > 3.9)

subset(iris, Sepal.Length > 7.6,
       select=c(Petal.Length,Petal.Width))
subset(iris, Sepal.Length > 7.6,
       select=c(Sepal.Length,Petal.Length,Petal.Width))

#######################################################
iris[iris$Species == "setosa", ]
# iris[iris$Species == "setosa"] # 오류

# 조건에 맞는 모든 행을 선택 한 후, 특정 열만 보이게
iris[iris$Sepal.Length > 7.6, ][c('Petal.Length', 'Petal.Width')]
iris[iris$Sepal.Length > 7.6, ][c('Sepal.Length', 'Petal.Length', 'Petal.Width')]

identical(subset(iris, Species == "setosa"), iris[iris$Species == "setosa", ])
#######################################################


