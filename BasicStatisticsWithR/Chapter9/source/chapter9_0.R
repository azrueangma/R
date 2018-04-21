#9장 준비 자료
#작성자 : 김민섭

########################
###아버지와 아들의 키###
########################


##기존 자료로부터 아버지와 아들의 키 자료 생성
hf <- read.csv("http://www.math.uah.edu/stat/data/Galton.csv",header=TRUE,stringsAsFactors = FALSE)
hf_string <- hf$Gender



str(hf)
#str : 데이터가 어떤 형태를 가졌는지 살펴볼 수 있다.

str(hf$Gender)
#hf 중에서 Gender만 형태를 보고 싶을 때 $를 이용하여 내부 header를 가져올 수 있다.

hf$Gender <- factor(hf$Gender, levels=c("M","F"))
#hg$Gender 데이터를 Factor화 시킨다. 그 레벨은 "M"과 "F"로 한다.
str(hf$Gender)
str(hf) #바뀐 데이터를 직접 확인.

hf.son1 <- subset(hf, Gender =="M")

#?subset
#벡터와 행렬, 데이터프레임을 조건에 맞게 부분집합화하는 함수
#이 코드에서는 hf데이터 중에서 Gender가 "M"인 부분집합을 골라내서 
#hf.son에 넣는 과정을 진행했다.
#응용이 가능하므로 데이터 슬라이싱할 때나 파생변수를 만들 때 유용한 함수이다.
#나중에 따로 내부함수 정리에서 다룰 예정이다.

str(hf.son) #내부 데이터형태 확인
hf.son2 <- hf.son1[c("Father","Height")]
#변수에 [조건]을 넣으면 인덱스한 조건에 따라 값을 반환한다.
#여기에서는 Header를 벡터화시켜 두 개의 인덱스를 넣으면 
#인덱스에 해당하는 열을 반환하는 것이 특징이다.

hf.son["Father"] # 벡터화 시키지 않아도 문자열로 Header를 찾아준다.
hf.son["Father","Height"] #둘 다 충족하는 값은 NULL로 판단했다. =값이 존재하지 않는다.

par(mar=c(4,4,1,1))
plot(hf.son$Father,hf.son$Height,
     xlab="아버지의 키",ylab="아들의 키",main= "아버지와 아들의 키",col=3)
abline(v=mean(hf.son$Father),col=2,lty=2)
abline(h=mean(hf.son$Height),col=2,lty=2)


str(hf)
#읽어온 데이터 구조 확인

str(hf_string)
str(hf$Gender) # 이 둘을 비교해보면 문자열로 된 Gender변수와
               # Factor로 된 Gender변수를 비교 할 수 있다.

str(hf.son1) #전체 데이터프레임에서의 변수를 보는 것과
str(hf.son2) #내가 보고싶은 특정 변수를 고른 것은 차이가 있다.



