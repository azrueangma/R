#사용자 정의 함수 만들기
options(digits=4)

var.p <- function(x){
  n <- length(x) #x의 원소의 총 개수를 저장
  m <- mean(x) #x의 평균을 저장
  num <- sum((x-m)^2) #편차 제곱합을 저장
  denom <- n #x의 원소의 총 개수를 넘겨줌
  var <- num/denom #모분산 구한다.
  return (var)
}

radius <- c(234, 234, 234, 233, 233, 233, 233, 231, 232, 231)
weight <- c(146.3, 146.4, 144.1, 146.7, 145.2, 144.1, 143.3, 147.3, 146.7, 147.3)

var.p(radius) #사용자 정의함수 사용(모분산)
var(radius) #R 내장 함수 사용(표본분산)

var.p(weight)
var(weight)