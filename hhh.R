df0 <- read.csv("~/3.9jan17Items.csv")
df1 <- read.csv("~/index_19.9mar17Items.csv")
df2<- read.csv("~/index_19.11_feb17Items.csv")
class(df$Time)
class(df$Time)
?names
if ("Cost" %in% names(df)){
  print("its in the columns")
}else if ("ceed" %in% names(df)){
  print("its in it")
}else{
  print("fuck")
}
medprice <-  median(df$Price , na.rm = T)
df$Prices <- ifelse(is.na(df$Price),medprice , df$Price)
df[,c("Price" , "Prices")]
df[1:2,3:4]

install.packages("dplyr")


allitem <-rbind(df0 , df1 ,df2)
structure(allitem)
nrow(allitem) == nrow(df0)+ nrow(df1) + nrow(df2)
leftside <- allitem[,1:12]
rightside <- allitem[,13:21]
allitems2 <- cbind(leftside , rightside)

filetoimport <- c("~/3.9jan17Items.csv",
                  "~/index_19.9mar17Items.csv",
                  "~/index_19.11_feb17Items.csv")
allitems <- data.frame()
for(f in filetoimport){
  tempdf <- read.csv(f , stringsAsFactors = F)
  allitems <- rbind(allitems , tempdf)
  print(f)
}
library(lubridate)
allitems$Time <- ymd_hms(allitems$Time)
allitemsmonthname <- month(allitems$Time , label = T)
summary(allitemsmonthname)
plot(allitemsmonthname)
names(df1)
class(df1)
library(dplyr)
t <- filter(df1, Cost>3)
t
y <- select(df1 , Cost,Price)
y

df
names(df1)
gf <- select(filter(df1,OperationType =="SALE"),Cost,Price)
gf
df_piped <- df1 %>% filter(OperationType =="SALE") %>% select(Cost,Price)
gf == df_piped
employee <- c("Vincent Ball","Rachael Price")
h <- df1 %>% filter(CashierName %in% employee)
h
df1 <- df1 %>% mutate(dice = ifelse((Price>2),1,0))
df1$dice
dice_items <- df1 %>% filter(dice == 1) %>% select(LineItem)%>% distinct()
dice_items
df
library(dplyr)
?summarise
df_co <- df1%>%group_by(Department)%>%summarise(mean_price=mean(Price),mn_cost=mean(Cost))
df_department <- df1%>%group_by(Department)%>%summarise(avr_price = mean(Price) , avr_cost =mean(Cost))
                                        
summary(df_co)
summary(df1$Department,labels(T))
summary(df1)
sum(is.na(df_co))
Sales
colSums(is.na(df1))
library(tidyr)
tax <- replace_na(df1$Tax , mean(df1$Tax,na.rm =TRUE ))
sum(is.na(tax)
names(df1)    
tax    
