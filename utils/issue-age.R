library(ggplot2)
library(ggthemes)

data <- read.csv('../data/age-issues-tags.csv')

fac <- with(data, reorder(Label, Age, median, order = TRUE)) # finds median
data$Label <- factor(data$Label,levels=levels(fac)) # Orders factors according to median
data$Age <- data$Age/86400
ggplot(data,aes(Label,Age))+geom_point(data=data,aes(x=Label, y=Age,fill=State,color=Label,stroke=1),shape=21,position='jitter',size=5)+geom_boxplot()+ scale_y_log10()+theme_tufte()
