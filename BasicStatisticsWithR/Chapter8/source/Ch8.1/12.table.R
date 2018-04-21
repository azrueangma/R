getwd()
setwd("C:/Users/MIN-SEOP/iCloudDrive/!R스터디/Chapter07/data")


sns.c <- read.csv("snsbyage.csv", header=T, stringsAsFactors=FALSE)
str( sns.c )

sns.c <- transform(sns.c, age.c = 
                     factor(age, levels=c(1, 2, 3), 
                            labels=c("20대", "30대", "40대")))

sns.c <- transform(sns.c, service.c = 
                     factor(service, levels=c("F", "T", "K", "C", "E"), 
                            ordered=TRUE))

?margin.table

a<- factor(c("a","a","a","a","b",'b',"c",NA,NaN))


age.c.tab <- table(sns.c$age.c)
str(age.c.tab)
age.c.tab
margin.table(age.c.tab)
addmargins(age.c.tab)
prop.table(age.c.tab)

prop.table( age.c.tab)


c.tab <- table(sns.c$age.c, sns.c$service.c)
str(c.tab)
c.tab

margin.table(c.tab)
margin.table(c.tab, margin=1)
margin.table(c.tab, margin=2)

addmargins(c.tab)
addmargins(c.tab, margin=1)
addmargins(c.tab, margin=2)

apply(c.tab, 1, mean)
apply(c.tab, 2, mean)

prop.table(c.tab)
prop.table(c.tab, margin=1)
prop.table(c.tab, margin=2)


## xtabs()
xt.age <- xtabs(~age.c, data=sns.c)
str(xt.age)
xt.age
xt.sns <- xtabs(~age.c+service.c, data=sns.c)
xt.sns

s.data <- read.csv("xtab.count.csv", header=T)
s.data
xt.s.data <- xtabs(count~group+result, data=s.data)
xt.s.data
