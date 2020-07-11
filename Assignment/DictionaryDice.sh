#!/usr/local/bin/bash 
declare -A dictionaryDice


#Funciton Definition - declaring Array
function declareDictionary(){
for((i=1;$i<7;i++ ))
do
	diceValueHolder[$i]=0
done
}


#Funciton Definition - computing and displaying the Result 
function diceResultForMaxMin(){
diceValueHolder=$1
finish=0
while (( $finish<1 ))
do
	for((j=1;$j<7;j++ ))
	do
  		randomValue=$(( 1+RANDOM%6 ))
		if [[ $randomValue==${!diceValueHolder[j]} ]]
		then
			((diceValueHolder[$randomValue]++))
			if [[ ${diceValueHolder[$randomValue]} -eq 10 ]]
			then
				finish=1
				echo $randomValue HAS GOT THE FIRST 10 OCCURRENCES with Maximum Occurrences !!
				break
			fi
		fi
	done
done
#displaying the values & keys of the Dictionary 
for((j=1;$j<7;j++))
   do
      echo $j = ${diceValueHolder[$j]}    
   done
#finding Minimum Occurrences
minOccurrences=${diceValueHolder[1]}
min=0
for((i=2;$i<7;i++))
do
	if [[ ${diceValueHolder[$i]} -le $minOccurrences ]]
	then
		min=$i
		minOccurrences=${diceValueHolder[$i]}       
	fi
done
echo MIN OCCURING DICE NUMBER  = $min
}


#functionCalls
declareDictionary ${dictionaryDice[@]}
diceResultForMaxMin ${dictionaryDice[@]}
