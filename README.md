# G.Leone_F.Carey_Final_Project
The data taken from a ROV on a ship in the NE Atlantic
CTD data file which contains over 3 Gb of information 
For the purpose of this project we condensed this massive files in two smaller sub data sets which contain the information we needed whilst removing unwanted information. This was done in excel

Excel, Python and R studio or R are required

PART 1 CTD

Save CTD_DATA_third_try.csv in a new folder with the script Script CTD graphs.R and the script Script temp CTD graphs.R
Open R studio
Make sure all files are saved in the same directory and use this directory while using R
Open the file CTD_DATA_third_try.csv in R studio using the function read.csv

For the salinity graph do as follows:
Run the script provided named Script CTD graphs.R
This will output a salinity vs depth graph
If you want to save the graph as a picture or pdf use the export command

For temperature graph do as follows:
Run the script provided named Script CTD temp graphs.R
This will output a temperature vs depth graph
If you want to save the graph as a picture or pdf use the export command

PART 2 temperature changes over time

Make a new folder which contains the Final_Python_Script.py and the file CTD_small.csv
Using Jedit open the file Final_Python_Script.py
In the terminal move to the folder that you just created containg those files
Use command chmod u+x Final_Python_Script.py to modify the permission
use the command ./Final_Python_Script.py to run the script
Check the folder, you should have a new file called CTD_small.csv.csv
If you want to run the script for more than once be sure to delete the new file as the python script will keep adding info in the same file instead of updating it

Open now R studio and using the command read.csv open the file CTD_small.csv.csv 
Run the sript called Transect_Script.R
This will produce a graph for the temperature changes with depth time will be on x axes and depth on the y axes
there will be a legend describing the changing colors according to the temperature that they represent
If you want to save the graph as a picture or pdf use the export command






