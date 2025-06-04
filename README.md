Task 1:Archive logs (written by Keira)
This infrastructure mimics the hospital's real-time monitoring of hospital parameters like heart rate, temperature, and water intake. This infrastructure continuously collects data from dummy sensors—heart rate, temperature, and water meters—and saves this data in active log files.To maintain the ever-expanding log files in check and to allow easy monitoring, the system also possesses an interactive archival scprit.

We have three simulators(python):
1.heart monitor.py: Simulates two heart rate monitors
2.temp sensor.py: Simulates two temperature sensors
3.water meter.py: Simulates water usage

Maellene first created an input function() which serves as the main interactive prompt which asks the user to choose which log file to archive.Its's main purpose is to display a menu, take user input and call the appropriate archiving action based on the user's selection.

Then Dedine created the archive function() which is responsible for archiving the selected log file. It basically rotates the logs by renaming and archiving them with the timestamp, by using format specifiers with the date command, and then prepares the system for contiunous monitoring without deleting the data. The following are the steps on how it works:
1.Receives the path
 2.Identifies the log type
 3.Generates a timestamp
 4.Creates the appropriate archive folder if it doesn't exist
  The mkdir -p command is used to handle archive directory issues (if the archive directory does not exist, it will create it) 
 5.Rename and move the file to the archive folder
 6.Creates a new empty log file at the original location for continued monitoring

There is also the error handling under the archive function() where by if the log file is missing, the function notifies the user and then stops. 





TASK 2 - Interactive Archival Script (written by Cherish)

This script is used to analyze the log files that are created by the python simulators and append the analysis of the selected log file to a general report analysis register. The script was worked on by Kamy and Jeremiah.

Kamy wrote the first few lines and the input function and Jeremiah wrote the analyze function

The first two lines of the file display the options to choose from and takes the user input with the echo -e command  and the read command respectively.
The -e flag with the echo command to enable escaping of characters

The Input Function calls the analyze function for each file, and it handles errors for invalid user input using conditionals.

The analyze function
The first line of the analyse function creates the reports directory using the mkdir -p command.
It makes use of the -p flag in the mkdir function to create the reports directory in the current directory if it does not exist. If the directory exists, that line of code is skipped.

The first time stamp is collected with the head command, and stored in a variable.
The last time stamp is collected with the tail command, and stored in a variable also.
The time of analysis of the file is collected using the date variable

Using conditionals, the analyze function appends the analyzed contents which are specific to the selected file to the analysis report.txt file. 
It makes use of the awk command to get each unique device in the log file and the number of times they occurred.

It makes use of the while loop to append each device and their occurrences into the report file.

Finally, the analyze_logs.sh script calls the input function.

