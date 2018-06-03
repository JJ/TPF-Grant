library(ggplot2)
library(ggthemes)

data <- read.csv("../data/closed-jj.csv")

data.may <-  data[data$Month == " 2018-05-01T00:00:00",]
ggplot(data.may, aes(x=Author,y=Closed.Issues, fill=Author))+geom_bar(stat='identity')+theme_tufte()

ages <- read.csv("../data/age-closed.csv")
ggplot(ages, aes(x=Author,fill=Closed.Issues, y=Avg.Age))+geom_bar(stat='identity')+theme_tufte()
