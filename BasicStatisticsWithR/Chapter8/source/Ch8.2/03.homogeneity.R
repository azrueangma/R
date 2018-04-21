setwd("b:/R/Chapter8/data")

sns.c <- read.csv("snsbyage.csv", header=T, stringsAsFactors=FALSE)
str( sns.c )
sns.c
sns.c <- transform(sns.c, age.c = 
                  factor(age, levels=c(1, 2, 3), 
                  labels=c("20대", "30대", "40대")))

sns.c <- transform(sns.c, service.c = 
                  factor(service, levels=c("F", "T", "K", "C", "E"), 
                  ordered=TRUE))
head(sns.c)
c.tab <- table(sns.c$age.c, sns.c$service.c)
(a.n <- margin.table(c.tab, margin=1))
(s.n <- margin.table(c.tab, margin=2))
(s.p <- s.n / margin.table(c.tab))
(expected <- a.n %*% t(s.p))

(o.e <- c.tab-expected)
pvalue = (t.t <- sum(  (o.e)^2 / expected ))


qchisq(0.95, df=8)


1-pchisq(t.t, df=8)

chisq.test(c.tab) 
addmargins(chisq.test(c.tab)$expected)


# 그림 8-1코드 이용
x <- seq(0, 120, by=0.01)
dc <- dchisq(x, df=8)

alpha <- 0.05
tol <- qchisq(0.95, df=8)

par(mar=c(0,1,1,1))
plot(x, dc, type="l", axes=F, ylim=c(-0.03, 0.25), xlab="", ylab="")
abline(h=0)
tol.g <- round(tol, 2)
polygon(c(tol.g, x[x>tol.g], 15), c(0, dc[x>tol.g], 0), col="red")
text(0, -0.01, "0", cex=0.8)
text(tol, -0.01, expression(chi[0.05]^{2}==15.50731), cex=0.8)

abline(v=pvalue)
text(pvalue, -0.01, expression(검정통계량 : 102.752), cex=0.8)

#이 값이 왜 0 에 가까운 값이 되었는지 생각해보자.
1-pchisq(pvalue, df=8)

