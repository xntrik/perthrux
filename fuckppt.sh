font="standard"
while read line
do
	if [ "${line:0:2}" = "# " ]
	then
		font=`echo $line | awk '{print $2 }'`
	else

		missing=`echo $line | figlet -f $font | wc -l`
		oneither=`echo $[24-missing]/2 | bc`

		for (( c=1; c<=$oneither; c++ ))
		do
			echo 
		done

		echo $line | figlet -f $font -c

		if [ $[missing % 2] -ne 0 ]
		then
			test=1
		else
			let "oneither -= 1"
		fi
		for (( c=1; c<=$oneither; c++ ))
		do
			echo 
		done
	fi

done
