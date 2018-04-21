data1<-read.csv(file = "c:/Users/MIN-SEOP/Google 드라이브/R/Chapter8/data/00.example.csv")
str(data1)
head(data1)

names(data1) <- c("num","height")
head(data1)

data1 <- data1[,-1]

n=40 #측정된 데이터는 40개이다.
k=8  #k값은 기대도수가 5 이상 되도록 임의로 선정한다.
alpha=0.01 #유의수준은 1%이다.

mean(data1)
sum(data1)/length(data1) #두 값이 일치함을 볼 수 있다.
(Xbar <- mean(data1))

var(data1)
(S<-sum((data1-mean(data1))^2)/(length(data1)-1)) #n-1을 해준 표본분산과 일치한다.


install.packages("ggplot2")
library(ggplot2)
# (1) 정규분포 그래프 (Normal distribution plot, X~N(0,1)) 

ggplot(data.frame(x=c(-3,3)), aes(x=x))+ 
  stat_function(fun=dnorm, colour="blue", size=1) +ggtitle("Normal Distribution")+ geom_vline(xintercept=Z, colour="grey", linetype="dashed", size=1)


#각 구간에 해당하는 Z값 구하기
Z<- c(qnorm(0.125, mean=0, sd=1, lower.tail=T),
qnorm(0.250, mean=0, sd=1, lower.tail=T),
qnorm(0.375, mean=0, sd=1, lower.tail=T),
qnorm(0.500, mean=0, sd=1, lower.tail=T),
qnorm(0.250, mean=0, sd=1, lower.tail=T),
qnorm(0.125, mean=0, sd=1, lower.tail=T))

pnorm(q = Z[1])
quantile(x = data1,prbos = Z)

set.seed(0708)
data1 <- rnorm(40,mean = 174,sd = 10)
round(data1,2)
hist(data1)
