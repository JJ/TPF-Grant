library(ggplot2)
library(ggthemes)

data <- read.csv('../data/age-issues-tags.csv')

data$Label <- as.Level(data$Label)
data$Age <- data$Age/86400
ggplot(data,aes(x=Label,y=Age,color=Label))+geom_point(position='jitter')+geom_boxplot()+scale_y_log10()+theme_tufte()
