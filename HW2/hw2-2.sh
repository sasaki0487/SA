#check if raw and parsed timetable exits
if [ ! -e parsed.txt ]; then
	if [ ! -e text.json ]; then
		curl 'https://timetable.nctu.edu.tw/?r=main/get_cos_list' --data 'm_acy=107&m_sem=1&m_degree=3&m_dep_id=17&m_group=**&m_grade=**&m_class=**&m_option=**&m_crsname=**&m_teaname=**&m_cos_id=**&m_cos_code=**&m_crstime=**&m_crsoutline=**&m_costype=**’' >> text.json
	fi
	sed 's/,/\
		/g' text.json | awk 'BEGIN {FS=":"} /cos_time/ {s1=$2} /cos_ename/ {printf("%s %s\n",s1,$2)}' | sed 's/\"//g' | sed 's/\ /_/g' | awk 'BEGIN{n=0} {n++;printf("%s %s off \n",n,$1)}' > parsed.txt
fi

while true ; do
	dialog --extra-button --extra-label "Option" --ok-label "Add Class" --cancel-label "Exit" --yesno test 200 200
	main_status=$?

	if [ "$main_status" -eq 0 ]; then #add class
		classes=$(cat parsed.txt)
		opt=$(dialog --output-fd 1 --title "Add class" --buildlist "Add class" 200 200 200 $classes)
		if [ $? -eq 0 ]; then
			sed -i '' 's/ on/ off/g' parsed.txt
			for ln in $opt ; do
				sed -i '' "$ln s/ off/ on/g" parsed.txt
			done
		fi
	elif [ "$main_status" -eq 1 ]; then #exit
		break
	else
		echo "$main_status" #option main_status == 3
	fi
done
