data = read.csv(file = "CTD_DATA_third_try.csv", sep =",")
data = data[seq(from=1, to=nrow(data), by = 30),]
#data = data[seq(from=1, to=1081),]
data$Depth = data$Depth - max(data$Depth)
data = data[order(data$Depth,decreasing=TRUE),]
plot(data$Salinity, data$Depth,type="o")
plot(data$Salinity, data$Depth,type="o",col="red",xlab="Salinity",ylab="Depth (m)",main="Salinity vs. Depth")


































