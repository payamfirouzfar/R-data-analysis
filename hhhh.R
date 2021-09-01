df <- read.csv("3.8jan17Weather.csv" ,sep = "," , stringsAsFactors = F)
dfw <- read.csv("3.9jan17Items.csv" , sep = "," , stringsAsFactors = F)
str(df)
class


summary(df1[,c("Time" ,"Tax")])
"$55214"
"584756"
library(lubridate)
date1 <- "April 03,2005"
date2 <- "04/03/05"
date3 <- 040305
d1 <-  as.Date(date1 , format = "%B %d, %Y")
d2 <- as.Date(date2 , format = "%m/%d/%y")
d3 <- as.Date(date3 , format = "%m/%d/%y")
d4 <- as.Date(date3 , origin = "1970-01-01")
t1 <- mdy(date1)
t2 <- mdy(date2)
t3 <- mdy(date3)
tw1 <- mdy_hms("04-02-2005 10:20:02")
tw2 <- mdy_hms("05-02_2017 15:08:00")
tw3 <- mdy_hms("04-02-2005 16:28:02")
tw2tw1[1]+28
t1 + 28
bom <- ymd("2000-01-01")
y <- t1 - bom
y
class(y)
o <-  tw3 -tw1
as.numeric(y)
difftime(tw1 , tw3 , units = "weeks")
year(tw1)
month(tw1)
day(tw1)
wday(tw1 , label =TRUE)
#### read in the data ####

df <- read.csv("E:/udemyha/business analytics/introduction to business analytics with R/3.9jan17Items.csv")
class(df$Time)
df$Time <- ymd_hms(df$Time)
class(df$Time)
summary(df$Time)
df$wday <- wday(df$Time , label = T)
summary(df$wday)
bar <-  factor(df$Category)
plot(df$wday , bar,type = 1)
unique(df$LineItem)
summary(factor(df$LineItem))  
str(factor(df$LineItem))
plot(factor(df$LineItem))
install.packages("forcats")
library(forcats)
df$LineItem3 <- forcats::fct_infreq(factor(df$LineItem))
str(df$LineItem3)
plot(df$LineItem3)
?fct_lump
df$LineItem5 <- fct_infreq(fct_lump(df$LineItem , n = 3))
plot(df$LineItem5)
df$LineItem6 <- fct_relevel(df$LineItem5 , "Chicken and Onion Kabob")
plot(df$LineItem6)
v1 <- c(1,5,10,12,15)
5 %in% v1
!5 %in% v1
brdf <-  df [df$Category %in% c("Beef" , "Rice") ,]
x <- c(5,15)
y <- c(10 , 12)
ifelse(x>y , "x is greater than y" , "y is greater than x"

       
       
a <-  15
b <- 17
if(a == b){
  print ("a is equal to b")
  comp <- "a is not b"
}else{
  print("a is b")
  comp <- "a wa b"
}
?names
names(wdf)
