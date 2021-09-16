df <- read.csv("E:/udemyha/business analytics/introduction to business analytics with R/index_33.4ities_date.csv")
wf <- read.csv("E:/udemyha/business analytics/introduction to business analytics with R/index_33.5df_weather.csv")
library(dplyr)                
####left_join####
df_left_join <- left_join(df,wf,by = "date")
colSums(is.na(df_left_join))
