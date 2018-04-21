data <- read.csv('D:/GoogleDrive/R/Chapter4/source/iris.csv',header=FALSE)
head(data)
names(data) <- c("sepal_length","sepal_width","petal_length","petal_width","class")
head(data)

cor = data$sepal_length

#편차를 구해서 변수 dev에 저장한다. 
#편차들의 제곱을 모두 더해 변수 num에 저장한다. 
#자료의 개수를 denom에 저장한다.
#자료의 개수 - 1 을 변수 denom2에 저장한다. 

#편차 제곱합을 자료의 개수로 나눈 모분산을 구한다.
#편차 제곱합을 자료의 개수-1로 나눈 표본분산을 구한다. 
var(cor) #R이 제공하는 분산함수(var)과 비교한다. 


#사용자 정의 함수 만들기
var.p <- function(x){
  #x의 원소의 총 개수를 변수 n에 저장
  #x의 평균을 변수 m에 저장
  #편차 제곱합을 변수 num에 저장
  #x의 원소의 총 개수를 변수 denom에 저장
  #모분산 구하여 변수 var에 저장
  #var을 리턴한다. 
}
