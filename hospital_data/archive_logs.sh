#!/bin/bash

input() {
#collecting input
	echo "Select log to archive:"
	echo "1) Heart Rate"
	echo "2) Temperature"
	echo "3) Water Usage"
	echo "Enter choice (1-3):"

	read value
	
	#Error Handling
	if [ $value == 1 ]; then 
		archive ./active_logs/heart_rate_log.log
	elif [ $value == 2 ]; then 
		archive ./active_logs/temperature_log.log
	elif [ $value == 3 ]; then
		archive ./active_logs/water_usage_log.log
	else 
		echo "What you have inputed is an invalid option"
		echo "please select from 1-3" 
	fi
}

input 
