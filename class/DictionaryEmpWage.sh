#!/usr/local/bin/bash 
#CONSTANTS
IS_PART_TIME=1
IS_FULL_TIME=2
MAX_HRS_IN_MONTH=40
EMP_RATE_PER_HR=20
NUM_WORKING_DAYS=20

#VARIABLES
totalWorkHours=0
totalWorkingDays=0

declare -A empDailyWage

function getWorkingHours() {
case $1 in
	$IS_FULL_TIME)
		workHours=8
		;;
	$IS_PART_TIME)
		workHours=4
		;;
	*)
		workHours=0
		;;
esac
echo $workHours
}

function calDailyWage(){
	local workHrs=$1
	wage=$((workHrs*$EMP_RATE_PER_HR))
	echo $wage
}

while [[ $totalWorkHours -lt $MAX_HRS_IN_MONTH &&
			$totalWorkingDays -lt $NUM_WORKING_DAYS ]]
do
	((totalWorkingDays++))		
	workHours=$( getWorkingHours $((RANDOM%3)) )
	totalWorkHours=$(($totalWorkHours+$workHours))
	empDailyWage["$totalWorkingDays"]="$( calDailyWage $workHours )"
done

totalSalary=$((totalWorkHours*$EMP_RATE_PER_HR));

echo "Daily Wage " ${empDailyWage[*]}
echo " All Day " ${!empDailyWage[*]}

for counter in ${!empDailyWage[*]}
do
	echo $counter - ${empDailyWage[$counter]}
done
