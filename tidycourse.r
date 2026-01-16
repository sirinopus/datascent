library(tidyverse)
library(readr)

gss_cat %>%
  filter(if_any(c(relig, denom), ~str_detect(.x, "Other")))
#filter out relig or denom having "Other"
# instead of "if_any", if you use "if_all",
#then it looks for relig and denom combo (both)

#modifying existing or create new columns in data.frame using mutate()

