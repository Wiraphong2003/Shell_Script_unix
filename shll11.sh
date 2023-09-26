#!/bin/bash

tput clear
while true; do
#	tput clear
#	echo -e -n "\E[05;15H"------------"
	echo "Menu"
	echo "[A] calender"
	echo "[B] Finding Permission"
	echo "[C] Directiry"
	echo "[X] Exit"

	read -p "select menu: " ss	
	
	mkdir -p /home/user_2049_2/Public/test
	
	path1="/home/user_2049_2/Public/test:"
	path2="/home/user_2049_2/Documents:"
	path3="/home/user_2049_2/Downloads:"

	case $ss in
	[Aa])
		echo "Menu A get Calendar"
		read -p "INPUT Month" m
		read -p "INPUT Year" y
		
		echo "You cal $m Month $y Year"

		nametxt=("my1st.txt" "my2nd.txt" "my3rd.txt")
		paths=("$path1" "$path2" "$path3")
		for i in "${!paths[@]}"; do
			path="${paths[$i]}"
			filename="${nametxt[$i]}"
			if [ -n "$path" ]; then
				path=$(echo "$path" | sed 's/:$//')
				cal $m $y > "$path/$filename"
			fi
		done


#		cal $m $y > /home/user_2049_2/Public/test/my1st.txt
#		cal $m $y > /home/user_2049_2/Documents/my2nd.txt
#		cal $m $y > /home/user_2049_2/Downloads/my3rd.txt
		
	;;
	[Bb])
		echo "B"
		read -p "INPUT PREMISSION: " PP
		pathg=("$path1" "$path2" "$path3")

		for path in "${pathg[@]}"; do
	        command=$1
        	while [ $path ]
	        do
		   cd ${path%%:*} 2>/dev/null
	   	   temp='ls $1 2>/dev/null'
	              if [ -n "$temp" ]
      		      then
	                #echo "${path%%:*}"
                        pathfile=${path%%:*}
                        if [ -n "$pathfile" ]
	  		then
       			   for file in "$pathfile"/*;
			   do
		         	if [ -f "$file" ];
				then
		       		    permission=$(ls -l "$file"| grep -v "total" | awk '{ print $1}')
				    if [ $permission = $PP ]
				    then
					    namefile=$(basename "$file")
					    echo "Found [$permission] with file [$namefile] in [$pathfile]"
				    fi
				fi
			done
		else
			echo "Not Found [$pp]"
			fi
		      fi
      		      path=${path#*:}
        done
done

	;;
	[Cc])
		command=$1
		path=$path2
		while [ $path ]
		do
			cd ${path%%:*} 2>/dev/null
			result='ls $1 2>/dev/null'
			if [ -n "$result" ]
			then
				pathfile=${path%%:*}
				echo "mkdir DirInDoc to $pathfile"
				mkdir -p $pathfile/DirInDoc
			fi
			path=${path#*:}
		done

	;;
	[Xx])
		echo "Exit"
		exit 0
		i
	;;
	*)
		echo "select Not Found plasse select agent."
	;;
	esac
#	tput clear
done


