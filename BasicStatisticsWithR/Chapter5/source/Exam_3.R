# 15명의 고등학생 몸무게에 대한 데이터로 신뢰구간 값 구하기 실습
x <- c(70.2, 54.9, 67.0, 60.5, 63.4, 61.9, 71.8, 66.1, 72.6, 73.0, 68.7, 70.3, 66.2, 55.6, 65.9)
mean(x)
var(x); sd(x)
stem(x) # stem-and-leaf plot
# one-sided test : "greater"
t.test(x, # weight vector for t-test
       alternative = c("greater"), #  alternative = c("less", "greater", "two-sided")
       mu = 63.0, # mu of population
       conf.level = 0.95) # confidence level or confidence coefficient (1-α)
  