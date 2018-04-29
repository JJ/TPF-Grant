library(ggplot2)
library(ggthemes)

issues.t <- read.csv("../data/issues-timeline.csv")

issues.t$Time <- as.Date(issues.t$Time)
ggplot(issues.t, aes(x=Time,y=Open.Issues))+geom_line()+theme_tufte()
