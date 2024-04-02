library("jsonlite")
library("rlang")

# the following defines the variables

smoker_mean = 3050
smoker_sd = 590

non_smoker_mean = 3260
non_smoker_sd = 530

# the following calcs the pdf of each evaluated at their respective mean
smoker_mean_pdf = dnorm(smoker_mean, mean=smoker_mean, sd=smoker_sd)

non_smoker_mean_pdf = dnorm(non_smoker_mean, mean=non_smoker_mean, 
    sd=non_smoker_sd)

# print(smoker_mean_pdf)
# print(non_smoker_mean_pdf)

# the following calcs the prob that a baby is below 2500grams
# for both smokers and non smoker moms

low_bw = 2500

cdf_smoker_2500 = pnorm(low_bw, mean=smoker_mean, sd=smoker_sd)
cdf_non_smoker_2500 = pnorm(low_bw, mean=non_smoker_mean, sd=non_smoker_sd)

# print(cdf_smoker_2500)
# print(cdf_non_smoker_2500)

# the following calcs the prob that the bw of a bby born to a smoker
# is greater than the bw of one born to a non_smoker

# set new vars
d_mean = smoker_mean - non_smoker_mean
d_sd = non_smoker_sd + smoker_sd

d_pdf = 1 - (pnorm(0, mean=d_mean, sd=793.1))

print(d_pdf)