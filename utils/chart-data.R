library(ggplot2)
library(ggthemes)

data <- read.csv("../data/issues.csv")
opens.gt.1 <- data[data$created_by %in%  names( table(data$created_by)[table(data$created_by) > 1]),]
ggplot(opens.gt.1,aes(x=reorder(created_by,-table(created_by)[created_by])))+geom_bar()+scale_y_log10()+ coord_flip()+theme_tufte()
closes.gt.1 <- data[data$closer %in%  names( table(data$closer)[table(data$closer) > 1]),]
closes.gt.1 <- closes.gt.1[closes.gt.1$state == " closed",]
ggplot(closes.gt.1,aes(x=reorder(closer,-table(closer)[closer])))+geom_bar()+scale_y_log10()+ coord_flip()+theme_tufte()


mi.data <- read.csv("../data/commits-tpf.csv")
data.april <-  mi.data[mi.data$Month == "2018-04-01T00:00:00",]
ggplot(data.april, aes(x=Author,y=Commits))+geom_bar(state='identity')+theme_tufte()
