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
archive(){
	# Steps
	#1 stop the python process
	#2 rename the file with the current time
	#3 start the python file
	#4  move the file to the archive folder
	
	if [ $1 == ./active_logs/heart_rate_log.log ]; then
		echo "Archiving heart_rate.log..."
		mkdir -p ./archived_logs/heart_data_archive/

		if [[ -f "$1" ]]; then
			python3 ./heart_monitor.py "stop"

			New_name="heart_rate_$(date '+%Y-%m-%d_%H:%M:%S').log"
			mv ./active_logs/heart_rate_log.log ./active_logs/$New_name
		
			python3 ./heart_monitor.py "start"
		
			mv ./active_logs/$New_name ./archived_logs/heart_data_archive/
			echo "successfully archived to heart_data_archive/$New_name"

		else
			echo "The file you have selected has not started running"
			echo "Please start running a file to archive it!"
		
		fi	


	elif [ $1 == ./active_logs/temperature_log.log ]; then
                echo "Archiving temperature.log..."
                mkdir -p ./archived_logs/temperature_data_archive/

		if [[ -f "$1" ]]; then
			
                	python3 ./temp_sensor.py "stop"

                        New_name="temperature_$(date '+%Y-%m-%d_%H:%M:%S').log"
               		mv ./active_logs/temperature_log.log ./active_logs/$New_name

                	python3 ./temperature_sensor.py "start"

                	mv ./active_logs/$New_name ./archived_logs/temperature_data_archive/
                	echo "successfully archived to temperature_data_archive/$New_name"

		else
                        echo "The file you have selected has not started running"
                        echo "Please start running a file to archive it!"

		fi


	elif [ $1 == ./active_logs/water_usage_log.log ]; then
                echo "Archiving water_usage.log..."
                mkdir -p ./archived_logs/water_usage_data_archive/
		
		if [[ -f "$1" ]]; then
               		python3 ./water_meter.py "stop"

               		New_name="water_usage_$(date '+%Y-%m-%d_%H:%M:%S').log"
                	mv ./active_logs/water_usage_log.log ./active_logs/$New_name

               		python3 ./water_meter.py "start"


			mv ./active_logs/$New_name ./archived_logs/water_usage_data_archive/
                	echo "successfully archived to water_data_archive/$New_name"
		
		else
                        echo "The file you have selected has not started running"
                        echo "Please start running a file to archive it!"
		fi



	else
		echo "The file you wish to archive has not started running."
		echo "Please start the process of running the file and try again"

	fi
}

input
