# G.Leone_F.Carey_Final_Project
README, PRESENTATION, SCRIPTS
#First step:
#Opened large data set file in excel and converted to .csv then opened in jedit
#We used jedit as all our columns were moved to the same column so we used jedit 
#to seperate them into single columns.

#Search for: (\w+\:\w+\:\w+\s\w+)\,(\d+\/\d+\/\d+)\,(\-\d+\.\d+)\,(\d+\.\d+)\,(\d+\.\d+)\,(\d+\.\d+)\,(\d+\.\d+)
#Replace with: $1 $2 $3 $4 $5 $6 $7

#For the CTD data we only wanted to use the first 10m of depth. 
#Deleted excess rows using jedit.
#Used R to build two plots.
#Plot 1 - Salinity vs. Depth
#Plot 2 -Temperature vs. Depth

#For Salinity vs Depth:
data = read.csv(file = "CTD_DATA_third_try.csv", sep =",")
data = data[seq(from=1, to=nrow(data), by = 30),]
#data = data[seq(from=1, to=1081),]
data$Depth = data$Depth - max(data$Depth)
data = data[order(data$Depth,decreasing=TRUE),]
plot(data$Salinity, data$Depth,type="o")
plot(data$Salinity, data$Depth,type="o",col="red",xlab="Salinity",ylab="Depth (m)",main="Salinity vs. Depth")

#For Temparature vs. Depth 
data = read.csv(file = "CTD_DATA_third_try.csv", sep =",")
data = data[seq(from=1, to=nrow(data), by = 30),]
#data = data[seq(from=1, to=1081),]
data$Depth = data$Depth - max(data$Depth)
data = data[order(data$Depth,decreasing=TRUE),]
plot(data$Temperature, data$Depth,type="p")
plot((data$Temperature),(data$Depth),type="p",col="blue",xlab="Temperature",ylab="Depth (m)",main="Temperature vs. Depth")

#These scripts gave us our graphs.

#We used python to edit our orignal datafile (CTD_small.csv)
#We wanted to read every 30minutes instead of every second. 

#!/usr/bin/env python


#import itertools for efficient looping
import itertools
#import csv to read a csv file
import csv
#save input csv file as MyFile and the name of the file we want to ouput as OutFile. 
#Put all this before loop
MyFile = ('CTD_small.csv')
InFile = open(MyFile,'r')
OutFileName=MyFile + '.csv'
OutFile=open(OutFileName, 'wa')

#open csv file and loop it to read every 1800 lines thereby reading the file for every 30 mins as opposed to every second.

with open ('CTD_small.csv') as csvfile:
	readCSV = csv.reader(csvfile)
	for row in itertools.islice(readCSV, None, None, 1800):
#If rerunning this script be sure to delete the new output file each time
#or else it will just print new lines to the file instead of updating it.
		print >>OutFile, ",".join(row)

#OutFile.write()
#This will save our file as CTD_small.csv.csv. 
InFile.close()
OutFile.close()

#Then we used R to construct a graph of temperature changes with depth across time using the output file CTD_small.csv.csv
#opened file and renamed variables.
d=read.csv("CTD_small.csv.csv")
d$Depth = d$Depth * -1
#x= d$Time
#y=d$Depth
#z=d$TEMPERATURE
#d = d[c(1,5,7)]

#This changed the time format from digital clock to numbers (minutes).
d$Time = seq(from=0,to=(length(d$Time)-1)*30,by=30)

#This function creates a colour pallette for the graph.
colfunc <- colorRampPalette(c("blue", "red"))
plot(x=d$Time,y=d$Depth,pch = 19, cex=2, col=gray((1:100)/100)[d$TEMPERATURE])

#This builds the graph. You can use pch to change shape of points and cex to change dimensions.
layout(matrix(1:2,ncol=2), width = c(2,1),height = c(1,1))
plot(x=d$Time,y=d$Depth,pch = 19, cex=2, col=colfunc(20)[d$TEMPERATURE], xlab="Time(min)", ylab="Depth(m)", main = "Temperature Changes With Depth")
#This provides the legend which indicates colour changes on the graphs colour palette.
legend_image <- as.raster(matrix(colfunc(20), ncol=1))
plot(c(0,2),c(0,1),type = 'n', axes = F,xlab = '', ylab = '', main = 'Temperature')

#This labels the legend.
text(x=1.5, y = seq(0,1,l=5), labels = seq(8,11,l=5))
rasterImage(legend_image, 0, 0, 1,1)








