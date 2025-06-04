<<<<<<< HEAD
Task 1:Archive logs
This infrastructure mimics the hospital's real-time monitoring of physiological parameters like heart rate, temperature, and water intake. This infrastructure continuously collects data from dummy sensors—heart rate, temperature, and water meters—and saves this data in active log files.To maintain the ever-expanding log files in check and to allow easy monitoring, the system also possesses an interactive archival scprit.

We have three simulators(python):
1.heart monitor.py: Simulates two heart rate monitors
2.temp sensor.py: Simulates two temperature sensors
3.water meter.py: Simulates water usage

Maellene first created an input function() which serves as the main interactive prompt which asks the user to choose which log file to archive.Its's main purpose is to display a menu, take user input and call the appropriate archiving action based on the user's selection.

Then Dedine created the archive function() which is responsible for archiving the selected log file. It basically rotates the logs by renaming and archiving them with the timestamp,and then prepares the system for contiunous monitoring without deleting the data. The following are the steps on how it works:
1.Receives the path
 2.Identifies the log type
 3.Generates a timestamp
 4.Creates the appropriate archive folder if it doesn't exist
 > The mkdir -p command is used to handle archive directory issues (if the archive directory does not exist, it will create it) 
 5.Rename and move the file to the archive folder
 6.Creates a new empty log file at the original location for continued monitoring

There is also the error handling under the archive function() where by if the log file is missing, the function notifies the user and then stops. 
=======
# coding_lab_17
The first group assignment



more test
>>>>>>> 21e3a4d42796846306886f61cc4cc57931ccb856
