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
