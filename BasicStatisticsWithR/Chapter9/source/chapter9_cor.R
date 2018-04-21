x1 <- c(10,20,30,40)
y1 <- c(seq(from = 1,to = 20,by = 5))
x2 <- c(10,20,30,40)
y2 <- c(seq(from = 1,to = 100,by = 25))


plot(x1,y1, type="o", col="blue", pch="o", lty=1, ylim=c(0,110) )

points(x2, y2, col="red", pch="o")
lines(x2, y2, col="red",lty=2)


cor(x1,y1)

cor(x2,y2)

