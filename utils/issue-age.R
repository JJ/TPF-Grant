library(ggplot2)
library(ggthemes)
library(scales)

data <- read.csv('../data/age-issues-tags.csv')

fac <- with(data, reorder(Label, Age, median, order = TRUE)) # finds median
data$Label <- factor(data$Label,levels=levels(fac)) # Orders factors according to median
data$Age <- data$Age/86400
ggplot(data,aes(Label,Age))+geom_point(data=data,aes(x=Label, y=Age,fill=State,color=Label,stroke=1),shape=21,position='jitter',size=3)+geom_boxplot()+ scale_y_log10()+theme_tufte()

data.table <- table(data.frame(state=data$State,label=data$Label))
issues.label.tag <- as.data.frame.matrix(data.table)

data.counts <- data.frame(Label=data$Label,State=data$State)
fac <- with(data.counts, reorder(Label, State, length, order = TRUE)) # finds median
data.counts$Label <- factor(data.counts$Label,levels=rev(levels(fac))) # Orders factors according to length
ggplot(data.counts,aes(x=Label,fill=factor(State),y=(..count..)))+  geom_bar()
