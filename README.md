# CPU-and-Memory-Utilization-Shell-Script"

This shell script captures the CPU,Memory utilization and Number of File descriptors of the particular process using "top" and "lsof" command. The captured metrics are written into a CSV file. The script can be added to a cron entry to capture the metrics over the period of time. 

Command to execute script. 

sh <Script_Name> <Process_to_Monitor>

Example CPU and Memory utilization to be captured for the Java process. 
========================================================================

./MemWatch.sh Java






