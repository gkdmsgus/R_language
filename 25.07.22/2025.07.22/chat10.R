install.packages("https://cran.r-project.org/src/contrib/Archive/arules/arules_1.7-0.tar.gz",
                 repos = NULL, type = "source")
install.packages("arules")

library(arules)
library(arulesViz)
#데이터 불러오기와 관찰
setwd("C:/source")
ds <- read.csv("BreadBasket_DMS.csv") #거래 데이터 읽기
str(ds)
head(ds)
unique(ds$Item)

#'NONE' item 삭제
ds.new <- subset(ds,Item != 'NONE')
write.csv(ds.new,"BreadBasket_DMS_upd.csv", row.names = F)

#트랜잭션 포맷으로 데이터 읽기
trans <- read.transactions("BreadBasket_DMS_upd.csv",
                           format = "single",header = T,
                           cols = c(3,4),sep=",",rm.duplicates = T)
trans #트랜잭션 데이터 요약 정보
dimnames(trans)[[2]] #상품목록 확인
toLongFormat(trans) #거래별 상품 목록
inspect(head(trans,10))# 앞부분 10개 트랜잭션 출력

#상품 판매 빈도
itemFrequencyPlot(trans,topN=10, type="absolute", xlab="상품명",
                  ylab="절대 판매빈도",main="판매량 많은 상품", col= "green")
itemFrequencyPlot(trans,topN=10, type="relative", xlab="상품명",
                  ylab="절대 판매빈도",main="판매량 많은 상품", col= "blue")
#연관규칙 찾기
rules <- apriori(trans,parameter = list(supp = 0.001, conf = 0.7))
rules

#앞쪽 10개의 규칙 출력
options(digits = 2)
inspect(rules[1:10])

#code 10-6
#신뢰도 상위 10개 규칙 출력
rules.sort <- sort(rules,by= 'confidence', decreasing = T)
inspect(rules.sort[1:10])

#산점도 (지지도-향상도)
plot(rules.sort, measure=c("support","lift"), shading="confidence")
#Gragh plot
plot(rules.sort, method="gragh")
#Grouped Matrix Plot
plot(rules.sort,method="grouped")

## 연관 규칙의 저장
write(rules.sort, file = "BreadBasket_rules.csv", sep=',', quote=T,row.names=F)