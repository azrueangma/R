options(digits=4) #출력물의 자릿수를 4자리로 합니다.
var.p2<-function(x, na.rm=FALSE){ #var.p2는 두 개의 전달인자를 가지고 있다. 
  if(na.rm == TRUE){
    x<-(!is.na(x)) #벡터 x에서 결측이 아닌 값들만 가지고 온다. 
  }
  n <- length(x) #x의 원소의 총 개수를 저장한다.
  m <- mean(x,na.rm=na.rm) #내장함수 mean에도 na.rm이 있다. TRUE면 결측값 존재, 아니면 결측값 없음
  num <- sum((x-m)^2,na.rm=na.rm) #내장함수 sum에도 na.rm이 있다. 
  denom <- n #x의 원소의 총 개수를 넘겨받는다.
  var <- num/denom #모분산을 구한다. 
  return(var)
}

radius <- c(234,234,234,233,233,233,NA,231,232,231)
var.p2(radius)
var.p2(radius, na.rm=TRUE)

