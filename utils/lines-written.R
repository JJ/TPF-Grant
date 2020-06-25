library(ggplot2)
library(ggthemes)

data <- read.csv("../data/current-lines-written.csv",header=TRUE)
data$idu <- as.numeric(row.names(data))
ggplot(data,aes(x=idu,y=lines))+geom_point()+scale_y_log10()+scale_y_log10() +theme_tufte()
data$perc <- 100*data$lines/sum(data$lines)
data.top20 <- data[data$idu < 20,]
ggplot(data.top20,aes(x=reorder(Nick,-perc),y=perc))+geom_bar(stat='identity') + theme_tufte()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))

