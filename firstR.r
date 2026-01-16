library(tidyverse)
library(datasets)
x <- c(1:9)
y <- c(1:9) ^ 2
plot(x, y)

# generate 100 random vualues from standard normal 
# distribuyion and plot a QQ graph

set.seed(123)
random_df <- rnorm(10000)
qq_df <- qqnorm(random_df, main = "QQ plot of Standard Normal Dist., 
                                   generated from 10000 radom numbers")
# Add a reference line
qqline(random_df, col = "red3") 

# Comparing Normal Vs Non-Normal Data
set.seed(456)
#1. Normal Data 
normal_data <- rnorm(10000)
#2. Non-Normal Data
non_normal_data <- rexp(10000, rate = 1) 

# Plot Normal Data
dev.new() # Open a new plotting window/tab
qqnorm(normal_data, main = "QQ Plot: Normal Data")
qqline(normal_data, col = "blue")

# Plot Non_Normal Data
dev.new() # Opens a new plotting window/tab
qqnorm(non_normal_data, main = "QQ Plot: Exponential Data")
qqline(non_normal_data, col ="red")

gss_cat %>%
  filter(age >= 30, 
         str_detect(rincome, "[$]")) %>% #income known
  #instead of "[$]", if you write "$", you get a different result
  filter(between(year, 2005, 2010)) %>%
  filter(!is.na(tvhours))

# Advanced filter

gss_cat %>%
  filter(if_any(c(relig, denom), ~str_detect(.x, "Other")))
#filter out relig or denom having "Other"
# instead of "if_any", if you use "if_all",
#then it looks for relig and denom combo (both)