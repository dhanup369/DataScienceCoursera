
##Poisson Model
##Y~Poisson (mu)
##log(mu)=beta0+ beta1 *X
##beta0=0.5 , beta1 =0.3 using rpois function
system.time({
set.seed(30)
x<-rnorm(100)
log.mu<-0.5+0.3*x
y<-rpois(100,exp(log.mu))
summary(y)
plot(x,y)})


set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
y