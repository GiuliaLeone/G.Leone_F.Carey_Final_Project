d=read.csv("CTD_small.csv.csv")
d$Depth = d$Depth * -1
#x= d$Time
#y=d$Depth
#z=d$TEMPERATURE
#d = d[c(1,5,7)]

d$Time = seq(from=0,to=(length(d$Time)-1)*30,by=30)


colfunc <- colorRampPalette(c("blue", "red"))
plot(x=d$Time,y=d$Depth,pch = 19, cex=2, col=gray((1:100)/100)[d$TEMPERATURE])

layout(matrix(1:2,ncol=2), width = c(2,1),height = c(1,1))
plot(x=d$Time,y=d$Depth,pch = 19, cex=2, col=colfunc(20)[d$TEMPERATURE],xlab="Time(min)", ylab="Depth(m)", main = "Temperature Changes With Depth")

legend_image <- as.raster(matrix(colfunc(20), ncol=1))
plot(c(0,2),c(0,1),type = 'n', axes = F,xlab = '', ylab = '', main = 'Temperature')
text(x=1.5, y = seq(0,1,l=5), labels = seq(8,11,l=5))
rasterImage(legend_image, 0, 0, 1,1)


