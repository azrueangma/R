m10 <- rep(NA, 1000) #결측값 NA 1000개로 구성된 벡터를 만든다. 
m40 <- rep(NA, 1000)

set.seed(9) #난수 생성의 초깃값을 9로 고정 한다. 

for ( i in 1:1000){ #1부터 1000으로 생성되는 벡터의 원소 수만큼 반복문을 만든다. 
  m10[i]<-mean(rnorm(10)) #표본분포로부터 10개의 표본을 추출하고 그 평균을 m10 i번째 원소에 저장
  m40[i]<-mean(rnorm(40)) #표본분포로부터 40개의 표본을 추출하고 그 평균을 m40 i번째 원소에 저자
}

options(digits=4) #출력물의 자릿수를 4로 합니다. 
c(mean(m10),sd(m10)) #m10의 평균과 표준편차를 구하여 하나의 벡터로 출력합니다. 
c(mean(m40),sd(m40))

hist(m10, xlim=c(-1.5, 1.5),main="",xlab="x(n=10)",ylab="",col="cyan",border="blue")
#m10에 대하여 histogram을 그립니다. 

hist(m40, xlim=c(-1.5, 1.5),main="",xlab="x(n=40)",ylab="",col="cyan",border="blue")



