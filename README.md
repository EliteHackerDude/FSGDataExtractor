# FSGDataExtractor
Extracting FSG data logger data into .mat format

How to use
1. Download the Matlab and blank excel template
2. In the same folder as the matlab script use the excel file named FSGData copying the information from https://teams.dl.fsg.one/#/teams/TEAM-ID (its only important that you Logfiles IDs start in cell 2A, the rest is just for you to reference and not need to get the data) 
3. Hit run and the data should be saved as .mat files in the same folder
4. Have fun analysising

Problems
1. If your data isn't at 25Hz you may need to up the max data points this can be found on line 16
2. FSG might update how they store there data so the URL might update. The way i found the url to the data file was opening the page for the run i wanted and going into the network tab of the inspect elements. There you can copy the link to the largest file transfered which should be the data.
3. Any other problems don't hesistate to ask on reddit

How this works
So the FSG website stores it's data for the log file as a big list. You can access the file that contains the list for a specific run by going to a website https://teams.dl.fsg.one/api/v1/logs/Logfile_ID/file?&max-data-points=100000 replacing Logfile_ID in the URL with the ID given to that run of data and the max data points setting how many data points it will give you essentially setting the frequency. 

I wrote a matlab script that loads the IDs from an excel sheet and runs though all of them all. Loading the data from the file into matlab and then saving it as a .mat structure.
