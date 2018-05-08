library(ggplot2)
library(ggthemes)

issues.t <- read.csv("../data/issues-timeline-posix.csv")

issues.t$Time <- as.POSIXct(issues.t$Time)
ggplot(issues.t, aes(x=Time,y=Open.Issues))+geom_line()+theme_tufte()
issues.2018 <- issues.t[issues.t$Time >= "2018-01-01",]
ggplot(issues.2018, aes(x=Time,y=Open.Issues))+geom_line()+theme_tufte()
