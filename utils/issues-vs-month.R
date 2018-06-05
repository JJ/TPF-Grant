library(ggplot2)
library(ggthemes)
library("Hmisc")

data <- read.csv("../data/issues-vs-commits.csv")
model <- lm( data$Commits ~ data$Issues )
summary(model)
predicted <- data.frame( predicted.commits = predict( model, data), issues = data$Issues )
ggplot( ) + geom_point( data=data, aes(x=Issues,y=Commits) ) + geom_line( data=predicted,aes(x=issues,y=predicted.commits,color='Model'))
