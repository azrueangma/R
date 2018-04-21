mydata <- read.table("C:/Users/thdaq/Google 드라이브/R/Chapter7/data/chapter7.txt",header=T)
head(mydata)
var.test(mydata$weight ~ mydata$gender)
mydata2 <- read.csv("E:/GoogleDrive/R/Chapter7/data/iris.csv",header=F)
var.test(mydata2$V1 ~ mydata2$V2)

install.packages("ggplot2")
library("ggplot2")
ggplot(data.frame(x=c(0,5)), aes(x=x))+
  stat_function(fun=df, args=list(df1=17, df2=25), colour="blue", size=2)+annotate("segment", x=3, xend=3.5, y=1.1, yend=1.1, colour="blue", size=1)+
  annotate("text", x=4.3, y=1.1, label="F(df1=17, df2=25)")

qf(0.975, df1=17, df2=25)

qt(0.05, df=42)
