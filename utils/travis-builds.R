library(ggplot2)

builds <- read.csv("../data/builds-travis.csv")
builds.date <- setNames( data.frame(table(as.Date(builds$Date, "%Y-%m-%d"))),c("Date","Builds"))
