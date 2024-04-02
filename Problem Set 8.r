library("jsonlite")
library("rlang")

# define common values
mean=300
sd=50


# the following line is the prob that monthly balance is less than 240
q1 = pnorm(240, mean=mean, sd=sd)
print(q1)

# the following line is the prob that monthy balance is between 325 and 375
q2_num1 = pnorm(375, mean=mean, sd=sd)
q2_num2 = pnorm(325, mean=mean, sd=sd)

q2_ans = q2_num1 - q2_num2
print(q2_ans)

# the following calculates the 90% population quantile of X
q3 = qnorm(0.9, mean=mean, sd=sd)
print(q3)

# the following calculates an 85% probability interval
q4_lower = qnorm(0.075, mean=mean, sd=sd)
q4_upper = qnorm(0.925, mean=mean, sd=sd)

print(q4_lower)
print(q4_upper)

# the following calculates the 25th percentile value
q5_num1 = qnorm(0.25, mean=mean, sd=sd)
print(q5_num1)

# the following creates a graph 
 
 # define the x range
 x_range = seq((mean-4*sd), (mean+4*sd), (length.out=1000))

 # calc the density values for the x values
 y_range = dnorm(x_range, mean=mean, sd=sd)

 # plot the normal distribution
plot(x_range, y_range, type="l", lwd="2",
    col="blue", main= "Normal Distribution (mean = 300, sd = 2500)", 
    xlab = "X", ylab = "Density")

# highlight confidence interval at 85%
abline(v=q4_lower, col="red", lwd=2)
abline(v=q4_upper, col="red", lwd=2)
polygon(c(seq(q4_lower, q4_upper, length.out=100), q4_upper, q4_lower),
        c(dnorm(seq(q4_lower, q4_upper, length=100), mean, sd), 0, 0),
        col="skyblue", border=NA)

# add a legend
legend("topright", legend=c("85% Interval", "Density Curve"), 
    fill=c("skyblue", NA), border=c(NA, "black"),
    lwd=2, col=c(NA, "black"))
    