library(ggplot2)
library(ggthemes)

data <- read.csv("../data/issues.csv")
ggplot(data,aes(x=reorder(created_by,-table(created_by)[created_by])))+geom_bar()+scale_y_log10()+theme_tufte()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggplot(data,aes(x=reorder(closer,-table(closer)[closer])))+geom_bar()+scale_y_log10()+theme_tufte()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))
