library(ggplot2)
library(ggthemes)

commits.t <- read.csv("../data/commits-year-month.csv")
commits.t <- commits.t[-nrow(commits.t),] # Last month is not complete
commits.t$Year <- as.factor(commits.t$Year)
ggplot(commits.t, aes(x=Month,y=Commits,group=Year))+geom_line(aes(color=commits.t$Year))+geom_point(aes(size=Authors))+theme_tufte()+theme(legend.position="top")
ggsave("../illos/commits-year-month.png",width=16, height=9)
ggplot(commits.t, aes(x=Month,y=cumsum(Commits),group=Year))+geom_line(aes(color=commits.t$Year))+geom_point(aes(size=Authors))+theme_tufte()+theme(legend.position="top")
ggsave("../illos/cumulative-commits-year-month.png",width=16, height=9)
