raw <- read.csv("unempstates.csv")
raw[1:3,]

plot(raw[,5],type="l",ylim=c(0,12),xlab="month",ylab="unemployment rate")

points(raw[,32],type="l", cex = .5, col = "dark red")
points(raw[,15],type="l", cex = .5, col = "dark green")

rawt=matrix(nrow=50,ncol=416)
rawt=t(raw)
rawt[1:3,]

set.seed(1)
grpunemp2 <- kmeans(rawt, centers=2, nstart=10)
sort(grpunemp2$cluster)
grpunemp3 <- kmeans(rawt, centers=3, nstart=10)
sort(grpunemp3$cluster)
grpunemp4 <- kmeans(rawt, centers=4, nstart=10)
sort(grpunemp4$cluster)
grpunemp5 <- kmeans(rawt, centers=5, nstart=10)
sort(grpunemp5$cluster)

unemp <- read.csv("unemp.csv")
unemp[1:3,]
set.seed(1)
grpunemp <- kmeans(unemp[,c("mean","stddev")], centers=3, nstart=10)

o=order(grpunemp$cluster)
data.frame(unemp$state[o],grpunemp$cluster[o])
plot(unemp$mean,unemp$stddev,type="n",xlab="mean", ylab="stddev")
text(x=unemp$mean,y=unemp$stddev,labels=unemp$state, col=grpunemp$cluster+1)