library(ggplot2)
library(ggthemes)

data <- read.csv("../data/issues.csv")
opens.gt.1 <- data[data$created_by %in%  names( table(data$created_by)[table(data$created_by) > 1]),]
ggplot(opens.gt.1,aes(x=reorder(created_by,-table(created_by)[created_by])))+geom_bar()+scale_y_log10()+ coord_flip()+theme_tufte()
ggplot(data,aes(x=reorder(closer,-table(closer)[closer])))+geom_bar()+scale_y_log10()+ coord_flip()+theme_tufte()
