#!/usr/local/bin/bash 
month=( JAN FEB MAR APR MAY JUNE JULY AUG SEP OCT NOV DEC )
declare -A d
dte=0
for ((i=1;$i<51;i++))
do
	rnum=$((RANDOM%12))
	case $rnum  in
	1)
		dte=$((1+ $((RANDOM%29))))
		;;
	4)
		dte=$((1+ $((RANDOM%30))))
		;;
	6)
		dte=$((1+ $((RANDOM%30))))
		;;
	9) 
		dte=$((1+ $((RANDOM%30))))
		;;
	11)
		dte=$((1+ $((RANDOM%30))))
		;;
	*)
		dte=$((1+ $((RANDOM%31))))
		;;
	esac
	d[${month[$rnum]}]=${d[${month[$rnum]}]}" "PERSON_$i" "on" "$dte";"
done


for i in ${!d[*]}; do
echo People Born in $i are  ${d[$i]}
done
