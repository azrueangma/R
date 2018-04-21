getwd()
setwd("C:/Users/MIN-SEOP/iCloudDrive/!R스터디/Chapter07/data")

names <- c("고길동", "둘리", "영희")
gender <- c("2", "2", "1")
?data.frame

characters <- data.frame(name=names, gender=gender)
str(characters)

characters <- data.frame(name=names, gender=gender, 
                         stringsAsFactors=FALSE)
str(characters)
characters <- transform(
                characters, 
                f.gender=factor(gender, 
                         levels=c("1", "2"), labels=c("여자", "남자")))
str(characters)



sns <- read.csv("snsbyage.csv", header=T)
str( sns )
?transform
sns.c <- read.csv("snsbyage.csv", header=T, stringsAsFactors=FALSE)
str( sns.c )

sns.c <- transform(sns.c, age.c = 
                     factor(age, levels=c(1, 2, 3), 
                            labels=c("20대", "30대", "40대")))

sns.c <- transform(sns.c, service.c = 
                     factor(service, levels=c("F", "T", "K", "C", "E"), 
                            ordered=TRUE))

str(sns.c)

a<-c(1:5)
b<-array(1:5)
c<-factor(1:5)
d<-c("a","b","c","d","e")
e<-c(T,T,F,F,F)
f<-data.frame(a,b,c,d,e)
str(f)
