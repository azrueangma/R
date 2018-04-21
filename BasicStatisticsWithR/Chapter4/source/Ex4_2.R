set.seed(9) #난수 생성의 초깃값을 9로 고정한다.

n <- 1000 #n에 1000을 할당합니다. 
r1_mean <- rep(NA,n) #r1_mean에 NA를 1000개를 복사한 것을 벡터로 저장
r2_mean <- rep(NA,n) #r2_mean에 NA를 1000개를 복사한 것을 벡터로 저장

for (i in 1:n){
  r1_mean[i] <- mean(rnorm(4,mean=3,sd=1)) 
  #평균3, 표준편차1을 가지는 정규분포에서 표본 4개를 추출하여 평균을 구한다. 
  r2_mean[i] <- mean(rnorm(4,mean=170,sd=6)) 
  #평균170, 표준편차1을 가지는 정규분포에서 표본 4개를 추출하여 평균을 구한다. 
}

options(digits=4)#출력물의 자릿수를 4로 고정
c(mean(r1_mean),sd(r1_mean)) #벡터로 r1_mean의 평균과 표준편차를 출력
c(mean(r2_mean),sd(r2_mean)) #벡터로 r2_mean의 평균과 표준편차를 출력 

hist(r1_mean, prob=TRUE, xlab="표본평균",ylab="밀도",main="",col="orange",border="red")
#hist는 r1_mena의 히스토그램을 그린다. 
#prob=TRUE는 y축에 값이 아닌 확률이 오도록 한다. 
#xlab, ylab은 축의 이름
#col은 막대의 색, border는 막대경계의 색을 의미한다. 

x1 <- seq(min(r1_mean), max(r1_mean),length = 1000)
#r1_mean의 최소값과 최대값의 사이의 구간을 1000개로 나누어 담는다. 

y1 <- dnorm(x=x1, mean=3, sd=(1/sqrt(4)))
#정규분포에 대한 distribution funciton 

lines(x1,y1,lty=2, lwd=2, col="blue")
#선을 그린다. lty는 a vector of line types, ldw는 a vector of line widths

hist(r2_mean, prob=TRUE, xlab="표본평균",ylab="밀도",main="",col="orange",border="red")

x2 <- seq(min(r2_mean), max(r2_mean),length = 1000)
y2 <- dnorm(x=x2, mean=170, sd=(6/sqrt(4)))

lines(x2,y2,lty=2, lwd=2, col="blue")