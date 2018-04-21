rm(list=ls()) #기존 변수 라이브러리 비우기


View(cars) #데이터를 먼저 살펴본다.
plot(cars)

#speed는 자동차가 브레이크를 밟기 전 속력
#dist는 자동차가 브레이크를 밟고 밀려난 거리
#속력이 제동거리에 영향을 주었을까?
#->속력이 빨랐다면 제동거리도 길었을까?
#-> X 값이 높으면 ~ Y 값도 높을까?


#공분산 계산
cov(cars)

##심화
var(cars$speed) #speed의 분산
var(cars$dist)  #dist의 분산

plot(cars$speed,cars$dist)
abline(v=mean(cars$speed),col=2)
abline(h=mean(cars$dist),col=2)

text(x= 20,y = 100, labels = "(+,+)",cex = 4)
text(x= 6,y = 25, labels = "(-,-)",cex = 4)

#상관계수 계산
cor(cars)

##심화
cov(cars)[2] / (sd(cars$speed)*sd(cars$dist)) #공분산을 각 표준편차의 곱으로 나눈 것과 같다.

cor(cars,method = "pearson")  #기본값 ``
cor(cars,method = "kendall")  #비모수(정규분포 충족X) 자료
cor(cars,method = "spearman") #비모수 + 순서가 있는 자료
##


#회귀분석 계산

(reg <- lm(formula = dist~speed,data=cars))
(sumreg<- summary(reg))         #회귀계수의 유의성 검정


##심화
sumreg$r.squared     #R^2 결정계수
sumreg$adj.r.squared #adj R^2 수정된 결정계수
##

(areg <- anova(reg)) #회귀식의 유의성 검정

##심화
areg$Df        #회귀변수와 잔차의 자유도
areg$`Sum Sq`  #SSR,SSE
areg$`Mean Sq` #MSR, MSE
sqrt(areg$`Mean Sq`[2]) # 추정값의 표준오차
areg$`F value`[1] #F값
areg$`Pr(>F)`[1]  #F검정의 유의확률
##





#잔차의 등분산성 가정 확인
plot(cars$speed, residuals(reg))
abline(h=0, col="red", lty=2)



#잔차의 정규성 검정
n=length(cars$dist)
probabilities = (1:n)/(n+1)

##심화
normal.quantiles = qnorm(probabilities, mean(cars$dist, na.rm = T), sd(cars$dist, na.rm = T))
#평균과 표준편차가 주어졌을 때, 정규분포 상의 분위수를 구했다.
qqplot(x=normal.quantiles,y= rstandard(reg))

qqnorm(y = rstandard(reg))
qqline(y = rstandard(reg))
#plot(reg) #여기에서 두 번째 나오는 plot이 Q-Qplot이다.


#통계적인 test를 통해 결과를 얻기
shapiro.test(residuals(reg)) #관측치가 30개 미만일 때 주로 사용한다.
#관측치가 30개 이상일 경우 중심극한정리에 의해 정규분포에 근사한다고 보기 때문에
#30개 미만일 때 주로 사용하는 test이다.
