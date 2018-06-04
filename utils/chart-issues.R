library(ggplot2)
library(ggthemes)

issues.t <- read.csv("../data/issues-timeline.csv")

issues.t$Time <- as.POSIXct(gsub("T"," ",issues.t$Time))

ggplot(issues.t)+geom_line(data=issues.t,aes(x=Time,y=Open.Issues,color='Issues'))+geom_line(data=issues.t,aes(x=Time,y=Average.Age,color='Age'))+theme_tufte()
issues.2018 <- issues.t[issues.t$Time >= "2018-01-01",]
ggplot()+geom_line(data=issues.2018,aes(x=Time,y=Open.Issues,color='Issues'))+geom_line(data=issues.2018,aes(x=Time,y=Average.Age,color='Age'))+theme_tufte()

issues.e <- read.csv("../data/issues-timeline-excluded.csv")

issues.e$Time <- as.POSIXct(gsub("T"," ",issues.e$Time))

ggplot(issues.e)+geom_line(data=issues.e,aes(x=Time,y=Open.Issues,color='Issues'))+geom_line(data=issues.e,aes(x=Time,y=Average.Age,color='Age'))+theme_tufte()
issues.2018.e <- issues.e[issues.e$Time >= "2018-01-01",]
ggplot()+geom_line(data=issues.2018.e,aes(x=Time,y=Open.Issues,color='Issues'))+geom_line(data=issues.2018.e,aes(x=Time,y=Average.Age,color='Age'))+theme_tufte()

age.diff <- merge(issues.e,issues.t,by="Time")
ggplot()+geom_line(data=age.diff,aes(x=Time,y=Average.Age.x,color='Excluded'))+geom_line(data=age.diff,aes(x=Time,y=Average.Age.y,color='Included'))+theme_tufte()

issues.m <- read.csv("../data/issues-month.csv")
issues.m$deficit <- issues.m$Closed - issues.m$Open

ggplot()  +geom_line(data=issues.m,aes(x=Month,y=Open,group=1,color='Open')) +geom_line(data=issues.m,aes(x=Month,y=Closed,group=1,color='Closed')) +geom_bar(data=issues.m, stat='identity',aes(x=Month,y=Open-Closed,fill=Open-Closed)) + scale_fill_gradientn(colours=rainbow(4))+theme_tufte() + theme(axis.text.x = element_text(angle = 90, hjust = 1))
