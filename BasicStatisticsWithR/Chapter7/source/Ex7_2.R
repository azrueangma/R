mydata <- read.table("E:/GoogleDrive/R/Chapter7/data/chapter7.txt",header=T)
t.test(mydata$weight ~ mydata$gender, mu=0, alternative="less",var.equal=TRUE)

qt(0.025,df=42)
