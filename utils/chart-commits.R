library(ggplot2)
library(ggthemes)

commits.t <- read.csv("../data/commits.csv")

commits.t$Month <- as.Date(commits.t$Month)
ggplot(commits.t, aes(x=Month,y=Commits))+geom_line()+theme_tufte()
ggplot(commits.t, aes(x=Month,y=Commits))+geom_line()+geom_point(aes(size=Authors,color=Entropy))+theme_tufte()
