lng <- read.csv("E:/udemyha/business analytics/introduction to business analytics with R/index_33.6tidy_long.csv",stringsAsFactors=T)
wd <- read.csv("E:/udemyha/business analytics/introduction to business analytics with R/index_33.7tidy_wide.csv")
df0 <- read.csv("E:/udemyha/business analytics/introduction to business analytics with R/3.9jan17Items.csv",stringsAsFactors = T)
df1 <- read.csv("E:/udemyha/business analytics/introduction to business analytics with R/index_48.2ities_prem.csv",stringsAsFactors = F)

names(df0)

library(dplyr)
library(tidyr)
lng_new <- wd%>%pivot_longer(cols="Quantity_Katherine.Roth":"Quantity_Vincent.Ball",names_to = "cashier",values_to="quantity")
lng_new <- lng_new[,c(1,4,3,2)]
wide_new <- lng%>%pivot_wider(id_cols = c(LineItem,CustomerSatisfaction),names_from="CashierName",values_from="Quantity")
library(stringr)
df0$stl <- str_length(df0$LineItem)

df0$Price <- replace_na(df0$Price , mean(df0$Price,na.rm =TRUE ))
cor(df0$stl,df0$Price)
beef_item <- str_detect(df0$LineItem,"Beef")
beef_item
unique(df0[beef_item,]$LineItem)
df0[5,]
string1 <- "we will learn to fuk u"
str_replace(string1,"fuk","fuck")
str_split(string1," ")
library(ggplot2)
p1<- ggplot(data=df0, mapping = aes(x=Price))
p1
p3 <- p1+geom_histogram(bins = 200)
p3

p4 <- ggplot(data=df0, mapping = aes(y=Price))
p5 <- p4+geom_boxplot()+coord_cartesian(ylim=c(0,50))
p5

df0 <- df0 %>% mutate(dice = ifelse((Price>2),1,0))
df0$dice
p6 <- ggplot(data = df0%>%filter(dice==1),mapping = aes(x=LineItem))
p6+geom_bar(aes(y = ..count../sum(..count..)))+scale_y_continuous(labels = scales::percent_format())


df5 <- df0%>%filter(!is.na(Quantity))
df6 <- df0%>%filter(!is.na(Price))
p7 <- ggplot(data=df6, mapping = aes(x=Quantity,y=Price))
p8 <- p7+geom_point()+geom_smooth(method = "lm")
p8
df9 <- df0 %>% mutate(dice = ifelse((Price>2),1,0))
h<- factor(df9$dice)
df9 <- df9%>%filter(!is.na(dice))
p10 <- ggplot(data=df9, mapping = aes(x=(Price),fill=factor(dice)))
p10
p11 <- p10+geom_histogram(aes(y=..density..))
p11
p12 <- ggplot(data=df9, mapping = aes(y=log(Price),fill=Department))
p12+ geom_boxplot()
p13 <- ggplot(data=df9, mapping = aes(x = factor(dice),y=log(Price),fill=factor(dice)))+geom_violin()

p13

#### crossTabs ####
crosstabs <- xtabs(~Department +WeekDay, data = df1)
crosstabs
department <- rownames(crosstabs)
department
weekday <- colnames(crosstabs)
weekday
df2 <- expand.grid(department,weekday)
df2

count <- as.vector(crosstabs)
count
df2$count <- count
df2
class(crosstabs)
df2
p18 <- ggplot(data = df2,aes(x=Var1 , y=factor(Var2) , size=count))
p19 <- p18+geom_point(col = "purple")+labs(x="department" , y = "weekdays")
p19

df1 <- df1%>%mutate(beef1=ifelse(str_detect(LineItem,"Beef"),1,0))
install.packages("esquisse")
