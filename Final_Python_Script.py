#!/usr/bin/env python

print "Entering script"
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
		print >>OutFile, ",".join(row)
#		writer.writerows(row)
#function write will write the new file with the looped data. str will read the rows and \n will put them in seperate rows.
		#OutFile.write(str(row)+"\n")
		
#OutFile.write()

InFile.close()
OutFile.close()
print "Leaving script"
#Then we used R to construct a graph of temperature changes with depth across time.
#Opened file in excel and covnerted to /csv )text) then opened in jedit


