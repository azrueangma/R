data(UCBAdmissions)
UCBAdmissions
ucba.tab <- apply(UCBAdmissions, c(1, 2), sum)
round(prop.table(ucba.tab, margin=2) * 100, 1)

# 독립성 검정
(a.n <- margin.table(ucba.tab, margin=1))
(g.n <- margin.table(ucba.tab, margin=2))

(a.p <- a.n / margin.table(ucba.tab))
(g.p <- g.n / margin.table(ucba.tab))

(expected <- margin.table(ucba.tab) * (a.p %*% t(g.p)))
addmargins( expected )


## chi-square statistic
o.e <- (ucba.tab - expected)^2 / expected
addmargins(o.e)

chisq.t <- sum(o.e)
chisq.t
qchisq(0.95, df=1)
1-pchisq(112.250, df=1)
1-pchisq(chisq.t, df=1)


chisq.test(ucba.tab)

## continuity correction
o.e2 <- (abs(ucba.tab - expected)-0.5)^2 / expected
pvalue2 <- sum(o.e2)

chisq.test(ucba.tab, correct=FALSE)


# 그림 8-1코드 이용
x <- seq(0, 110, by=0.01)
dc <- dchisq(x, df=1)

alpha <- 0.05
tol <- qchisq(0.95, df=1)

par(mar=c(0,1,1,1))
plot(x, dc, type="l", axes=F, ylim=c(-0.03, 0.25), xlab="", ylab="")
abline(h=0)
tol.g <- round(tol, 2)
polygon(c(tol.g, x[x>tol.g], 15), c(0, dc[x>tol.g], 0), col="red")
text(0, -0.01, "0", cex=0.8)
text(tol, -0.01, expression(chi[0.05]^{2}==3.841459), cex=0.8)

abline(v=chisq.t)
text(chisq.t, -0.01, expression(검정통계량 : 92.20528), cex=0.8)

qchisq(0.95, df=1)

(chisq.t <- sum(o.e))

1-pchisq(chisq.t, df=1)
#마찬가지로 이 값이 왜 0에 가까운 값이 나왔는지 생각해보자.
