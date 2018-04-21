#모분산을 모를 때 95% 신뢰구간 구하기 실습
t.test_confi_95 <- t.test(x, alternative = c("two.sided"), mu = 63.0, conf.level = 0.95)
names(t.test_confi_95) # statistics

t.test_confi_95$conf.int # confidence interval at 95% confidence level

t.test_confi_95$conf.int[1] # lower limit

t.test_confi_95$conf.int[2] # upper limit
