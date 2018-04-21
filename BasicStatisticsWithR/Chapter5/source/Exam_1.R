# 문제) 100원짜리 동전 던지기를 1000번 했는데 앞면이 485번 나왔다.  그렇다면 이 동전은 앞면과 뒷면이 균일한 동전이라고 말할 수 있는지를 유의수준 5%로 검정하고, 신뢰계수 95%의 신뢰구간을 구하여라.

prop.test(x = 485, # number of success
          n = 1000, # sample size
          p=0.50, # proportion of success
          alternative = c("two.sided"), # two-sided test
          # alternative = c("greater"), # right-sided test
          # alternative = c("less"),# left-sided test
          conf.level = 0.95) # confidence level

prop.test_confi_95 <- prop.test(x = 485, n = 1000, p=0.50, alternative = c("two.sided"), conf.level = 0.95)

names(prop.test_confi_95)  # statistics

prop.test_confi_95$conf.int  # confidence interval at 95% confidence level

prop.test_confi_95$conf.int[1] # lower confidence limit

prop.test_confi_95$conf.int[2] # upper confidence limit


