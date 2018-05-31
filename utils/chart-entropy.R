library(ggplot2)
library(ggthemes)

entropy <- read.csv("../data/file-entropy.csv")

ggplot(entropy, aes(x=reorder(File,-Entropy),y=Entropy))+geom_point()+theme_tufte()+ scale_y_log10()

