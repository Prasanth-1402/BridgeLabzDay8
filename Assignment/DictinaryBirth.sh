#!/usr/local/bin/bash
declare -A inputDictionary 
read -p "Enter the Year :" year

function createDictionary(){
monthDictionary=$1
for((i=1;$i<13;i++))
do
   monthDictionary[$i]=" "
done
echo MONTH DICTIONARY = ${monthDictionary[@]}
echo DICTIONARY OF 50 RANDOM MONTH VALUES HAS BEEN CREATED
}



function computeMonth(){
monthDictionary=$1
for ((i=1;$i<51;i++))
do
	month=$(( 1+RANDOM%12 ))
	echo $i $month
	monthDictionary[$month]+=$i" "
		
done
}


function printResult(){
monthDictionary=$1
echo SO, THE RESULT IS :
for ((i=1;$i<13;i++))
do
	echo PEOPLE BORN ON MONTH $i ARE  ${monthDictionary[$i]}
done
}



if [[ $year == 1992 ]]
then
	createDictionary ${inputDictionary[@]}
	computeMonth ${inputDictionary[@]}
	printResult ${inputDictionary[@]}
fi
