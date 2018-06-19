library(ggplot2)
library(ggthemes)

data <- read.csv("../data/current-lines-written.csv")
data$idu <- as.numeric(row.names(data))
ggplot(data,aes(x=idu,y=lines))+geom_point()+scale_y_log10()+scale_y_log10() +theme_tufte()
