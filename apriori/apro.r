lastfm <- read.csv("Documents\\lastfm.csv")
lastfm[1:19,]
length(lastfm$user)

lastfm$user <- factor(lastfm$user)
levels(lastfm$user)
levels(lastfm$artist)

install.packages("arules")
library(arules)

playlist <- split(x=lastfm[,"artist"],f=lastfm$user)

playlist <- lapply(playlist,unique)
playlist[1:2]


playlist <- as(playlist,"transactions")

itemFrequency(playlist)

itemFrequencyPlot(playlist,support=.08,cex.names=1.5)

musicrules <- apriori(playlist,parameter=list(support=.01,confidence=.5))
inspect(musicrules)

inspect(subset(musicrules, subset=lift > 5))

inspect(sort(subset(musicrules, subset=lift > 5), by="confidence"))