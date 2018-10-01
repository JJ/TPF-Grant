library(ggplot2)
library(ggthemes)

# Probably obsolete.
commits.t <- read.csv("../data/commits.csv")

commits.t$Ratio <- commits.t$Commits / commits.t$Author
ggplot(commits.t, aes(x=Month,y=Ratio))+geom_line()+theme_tufte()
ggplot(commits.t, aes(x=Month,y=Entropy,color=Commits,size=Authors))+geom_line()+theme_tufte()
commits.t$MonthN <- c(commits.t$Commits[2:length(commits.t$Month)],0)
correlation <-
    data.frame(entropy=commits.t$Entropy[1:(length(commits.t$Entropy)-1)],
               commits.n=commits.t$MonthN[1:(length(commits.t$MonthN)-1)])
ggplot(correlation, aes(x=commits.n,y=entropy))+geom_point()+theme_tufte()

                                                    
commits.y <- read.csv("../data/commits-year.csv")
commits.y$Year <- as.Date(commits.y$Year)
ggplot(commits.y, aes(x=Year,y=Commits))+geom_line()+geom_point(aes(size=Authors,color=Entropy))+theme_tufte()
ggplot(commits.y, aes(x=Year,y=Commits,color=Entropy,size=Authors))+geom_line()+theme_tufte()

days.commits <- read.csv("../data/100commit-interval.csv")
ggplot(days.commits, aes(x=as.numeric(row.names(days.commits)),y=Days,group=1))+geom_line()+theme_tufte()

days.commits.1k <- read.csv("../data/1kcommit-interval.csv")
ggplot(days.commits.1k, aes(x=as.numeric(row.names(days.commits.1k)),y=Days,group=1))+geom_line()+theme_tufte()
