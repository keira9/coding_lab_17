#!/bin/bash

#prompt the user


echo -e  "Select log file to analyze: \n 1) Heart Rate (heart_rate.log) \n 2) Temperature (temperature.log) \n 3) Water Usage (water_usage.log) \n Enter choice (1-3): "
read value

heart_path=./active_logs/heart_rate_log.log
temp_path=./active_logs/temperature_log.log
water_path=./active_logs/water_usage_log.log


input() {
        if [ $value == 1 ]; then
                analyze $heart_path
                echo "heart_rate_log.log has been analyzed and added to the analysis_report file"

        elif [ $value == 2 ]; then
                analyze $temp_path
                echo "temperature_log.log has been analyzed and added to the analysis_report file"

        elif [ $value == 3 ]; then
                analyze $water_path
                echo "water_usage_log.log has been analyzed and added to the analysis_report file"

        else
                echo "The value you have selected is not in the list. Please select an option from 1-3"

        fi
}

analyze() {
		
		echo "analyzing file........"
                mkdir -p ./reports

                first_entry=$(head -n 1 $1)
                last_entry=$(tail -n 1 $1)

                if [ $1 == $heart_path ]; then
                        echo "_ _ _ Heart Rate Log File Analysis _ _ _" >>  ./reports/analysis_report.txt
                
                elif [ $1 == $temp_path ]; then
                        echo "_ _ _ Temperature Log File Analysis _ _ _" >>  ./reports/analysis_report.txt
                
                elif [ $1 == $water_path ]; then
                        echo "_ _ _ Water Usage Log File Analysis _ _ _" >>  ./reports/analysis_report.txt
                
                else
                        echo "The file that you have selected is invalid"

                fi



                echo "Time of the analysis: $(date)" >> ./reports/analysis_report.txt
                echo "Device Counts:" >> ./reports/analysis_report.txt


                # the line below creates a  summary of the log file, which contains the devices in the log file and thier occurences
                echo "$(awk '{ count[$3]++ } END { for (i in count) print i, count[i] }' $1)" > ./data

                #the line below  counts the number of devices
                number=$(cat ./data | wc -l)



                i=1
                while [ $i -le $number ];
                do

                        line=$(sed -n "${i}p" "./data")                   #This line of code selects each line of the summarized file and stores it in a variable
                        device=$(echo "$line" | cut -d " " -f1 )          #This line of code selects the name of the device
                        occur=$(echo "$line" | cut -d " " -f2 )           #This  line of code selects the number of occurences of  the device refernced above



                        echo "$device - $occur" >>  ./reports/analysis_report.txt
                        ((i++))
                        
                done


                echo "First Entry: $first_entry" >> ./reports/analysis_report.txt
                echo "Last Entry: $last_entry"  >> ./reports/analysis_report.txt
                echo "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _"  >> ./reports/analysis_report.txt
                echo "                                       "  >> ./reports/analysis_report.txt
		rm ./data
}



input
