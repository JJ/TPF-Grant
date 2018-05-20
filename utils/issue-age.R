library(ggplot2)
library(ggthemes)

data <- read.csv('../data/age-issues-tags.csv')

data$Label <- as.factor(data$Label)
data$Age <- data$Age/86400
ggplot(data,aes(Label,Age))+geom_point(data=data,aes(x=Label, y=Age,fill=State,color=Label,stroke=1),shape=21,position='jitter',size=5)+geom_boxplot()+ scale_y_log10()+theme_tufte()
