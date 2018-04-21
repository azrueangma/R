Ei = c(312.75,104.25,104.25,34.75)
Oi = c(315,101,108,32)

data1 <- data.frame(Ei,Oi)
str(data1)
summary(data1)

#데이터 살펴보기
#################
install.packages("psych")
library(psych) 
describe(data1) 

hist(data1$Ei)
hist(data1$Oi)
boxplot(data1)
#################

(residual <- Oi-Ei)
#마이너스가 존재한다.


#잔차를 구하고 제곱하는 이유
############################
sum(Oi-mean(Oi)) #평균을 빼서 나온 잔차의 합은 0
                 #마이너스 탓에 평균으로부터 떨어진 거리를 정량화하지 못함.

sum((Oi-mean(Oi))^2)/(length(Oi)-1)   #그래서 잔차에 제곱을 sum하여 분산을 구한다.
var(Oi)          #실제 var()분산 구하는 함수와 결과값이 일치

sqrt(var(Oi))    #분산값에 sqrt()루트를 씌워주면 원래의 단위로 환산이 된다.
sd(Oi)           #표준편차를 구하는 함수 sd()와 결과값이 일치한다.
############################

(residual2 <- residual^2)

(residual3 <- residual2/data1$Ei)

(data.frame(data1$Oi,data1$Ei,residual,residual3))

result <- (dt[1,] + dt[2,] + dt[3,] + dt[4,])
#p305의 표 8-4 만들기.

result[4] #카이제곱분포의 검정통계량



# 그림 8-1
x <- seq(0, 15, by=0.01)
dc <- dchisq(x, df=3)

alpha <- 0.05
tol <- qchisq(0.95, df=3)

par(mar=c(0,1,1,1))
plot(x, dc, type="l", axes=F, ylim=c(-0.03, 0.25), xlab="", ylab="")
abline(h=0)
tol.g <- round(tol, 2)
polygon(c(tol.g, x[x>tol.g], 15), c(0, dc[x>tol.g], 0), col="red")
text(0, -0.03, "0", cex=0.8)
text(tol, -0.03, expression(chi[0.05]^{2}==2.14), cex=0.8)



1-pchisq(0.470024,df=3) #카이제곱분포에서의 검정통계량 유의확률

x<- c(315,101,108,32)
chi <- chisq.test(x,p=c(9,3,3,1)/16)
chi$statistic


