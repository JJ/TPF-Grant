library(ggplot2)
library(ggthemes)

entropy <- read.csv("../data/perl6-doc-file-entropy.csv")

ggplot(entropy, aes(x=reorder(File,-Entropy),y=Entropy))+geom_point()+theme_tufte()+ scale_y_log10()

authors <- read.csv("../data/perl6-doc-file-authors.csv")

ggplot(authors, aes(x=reorder(File,-Authors),y=Authors))+geom_point()+theme_tufte()+ scale_y_log10()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))

entropy.a <- read.csv("../data/perl6-doc-author-entropy.csv")

ggplot(entropy.a, aes(x=reorder(Author,-Entropy),y=Entropy))+geom_point()+theme_tufte()+ scale_y_log10()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))

entropy.c <- read.csv("../data/perl6-doc-current-files.csv")
entropy.c <- entropy.c[ entropy.c$Entropy > 0,]
ggplot(entropy.c, aes(x=Size,y=Entropy,color=Authors))+geom_point()+theme_tufte()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))+ scale_x_log10()
ggplot(entropy.c, aes(x=Authors,y=Entropy,color=Size))+geom_point()+theme_tufte()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))+ scale_x_log10()


entropy.r <- read.csv("../data/perl6-rakudo-current-files.csv")
entropy.r <- entropy.r[ entropy.r$Entropy > 0,]
ggplot(entropy.r, aes(x=Size,y=Entropy,color=Authors))+geom_point()+theme_tufte()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))+ scale_x_log10()
ggplot(entropy.r, aes(x=Authors,y=Entropy,color=Size))+geom_point()+theme_tufte()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))+ scale_x_log10()
