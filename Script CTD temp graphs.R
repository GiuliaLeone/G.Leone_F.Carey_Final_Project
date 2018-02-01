data = read.csv(file = "CTD_DATA_third_try.csv", sep =",")
data = data[seq(from=1, to=nrow(data), by = 30),]
#data = data[seq(from=1, to=1081),]
data$Depth = data$Depth - max(data$Depth)
data = data[order(data$Depth,decreasing=TRUE),]
plot(data$Temperature, data$Depth,type="p")
plot((data$Temperature),(data$Depth),type="p",col="blue",xlab="Temperature",ylab="Depth (m)",main="Temperature vs. Depth")


































