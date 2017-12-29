# CPU-and-Memory-Utilization-Shell-Script"

This shell script captures the CPU,Memory utilization and Number of File descriptors of the particular process using "top" and "lsof" command. The captured metrics are written into a .csv file. The script can be added to a cron entry to capture the metrics over the period of time. 

The .csv file can be imported into Excel or can be opened with Excel for analyzing the CPU and Memory utilization by plotting the graph. 

Example Run.
=======================================================================

sh <Script_Name> <Process_to_Monitor>

Example CPU and Memory utilization to be captured for the Java process. 
========================================================================
Assume you want to monitor process called java. In this case you will launch the script as below.

./MemWatch.sh Java

The .csv file can be easily plotted in excel to get the idea of Memory and Cpu Utilization. 





