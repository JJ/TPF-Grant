library(ggplot2)
library(ggthemes)

entropy <- read.csv("../data/file-entropy.csv")

ggplot(entropy, aes(x=reorder(File,-Entropy),y=Entropy))+geom_point()+theme_tufte()+ scale_y_log10()

entropy.a <- read.csv("../data/author-entropy.csv")

ggplot(entropy.a, aes(x=reorder(Author,-Entropy),y=Entropy))+geom_point()+theme_tufte()+ scale_y_log10()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))
