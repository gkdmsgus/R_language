# 이전 메모리 제거
rm(list = ls())

# code 6-4
beers = c(5,2,9,8,3,7,3,5,3,5)                 # 자료 입력
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07,  # 자료 입력
         0.06,0.02,0.05)
tbl <- data.frame(beers,bal)                   # 데이터프레임 생성
tbl

plot(bal~beers, data=tbl)                 # 산점도
plot(bal~beers, tbl)                     # 산점도

res <- lm(bal~beers,data=tbl)                  # 회귀식 도출
abline(res)                                    # 회귀선 그리기
cor(beers,bal)                                 # 상관계수 계산
cor(bal, beers)                                 # 상관계수 계산

# code 6-5
cor(iris[,1:4])               # 4개 변수 간 상관성 분석
