mydata3 <- read.csv("E:/GoogleDrive/R/Chapter7/data/01.anorexia.csv",header=T)
n<-length(mydata3$Prior-mydata3$Post)
m<-mean(mydata3$Prior-mydata3$Post)
s<-sd(mydata3$Prior-mydata3$Post)
(t.t<-m/(s/sqrt(n)))

t.test(mydata3$Prior,mydata3$Post,paired=T,alternative="two.sided")
