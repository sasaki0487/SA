time=
make_table() {
    normal_table
}

normal_table(){
    cp time_check.txt normal_table.txt
    sed -E -i '' 's/_/ /g' normal_table.txt
    sed -E -i '' 's/[1-9][A-Z]|[1-9][A-Z] //g' normal_table.txt
    sed -E -i '' 's/(.{13})/\1\,/g' normal_table.txt
    awk 'BEGIN {FS=","} {for(i=1;i<=NF;i++) printf("%-13s,",$i)} {printf("\n")}' normal_table.txt > tmp.txt
    paste -d"," empty_time.txt tmp.txt > tmp2.txt
    sed -E -i '' '/[1-9][LNMXY],/d' tmp2.txt
    sed -E -i '' '/[67][A-Z],/d' tmp2.txt
    cp tmp2.txt normal_table.txt
    rm tmp.txt
    rm out.txt
    echo "x  .Mon          .Tue          .Wed          .Thr          .Fri              " >> out.txt
    for time in "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" ; do
        string_gen
        echo "=  ============== ============= ============= ============= ============= =" >> out.txt
    done

    mv out.txt normal_table.txt

}

string_gen(){
    ln=$(cat normal_table.txt | awk -v row="1$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str1=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str2=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str3=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str4=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    ln=$(cat normal_table.txt | awk -v row="2$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str5=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str6=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str7=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str8=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    ln=$(cat normal_table.txt | awk -v row="3$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str9=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str10=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str11=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str12=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    ln=$(cat normal_table.txt | awk -v row="4$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str13=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str14=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str15=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str16=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    ln=$(cat normal_table.txt | awk -v row="5$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str17=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str18=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str19=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str20=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    echo "$time  |$str1|$str5|$str9|$str13|$str17 |" >> out.txt
    echo ".  |$str2|$str6|$str10|$str14|$str18 |" >> out.txt
    echo ".  |$str3|$str7|$str11|$str15|$str19 |" >> out.txt
    echo ".  |$str4|$str8|$str12|$str16|$str20 |" >> out.txt
}

#check if raw and parsed timetable exits
if [ ! -e parsed.txt ]; then
	if [ ! -e text.json ]; then
		curl 'https://timetable.nctu.edu.tw/?r=main/get_cos_list' --data 'm_acy=107&m_sem=1&m_degree=3&m_dep_id=17&m_group=**&m_grade=**&m_class=**&m_option=**&m_crsname=**&m_teaname=**&m_cos_id=**&m_cos_code=**&m_crstime=**&m_crsoutline=**&m_costype=**??' >> text.json
	fi
	sed 's/,/\
		/g' text.json | awk 'BEGIN {FS=":"} /cos_time/ {s1=$2} /cos_ename/ {printf("%s %s\n",s1,$2)}' | sed 's/\"//g' | sed 's/ /_/g' | awk 'BEGIN{n=0} {n++;printf("%s %s off \n",n,$1)}' > parsed.txt
fi

if [ ! -e time.txt ]; then
	cat parsed.txt | awk '{
		split($2,chars, "")
		for(i=1;i<length($2);i++){
			if(chars[i]=="-") break
			if(chars[i]~/[0-9]/) num=chars[i]
			else printf("%s%s ",num,chars[i])
		}
		printf("\n")
	}' > time.txt
fi

rm -f time_check.txt
rm -f empty_time.txt
for i in 1 2 3 4 5 6 7 ; do
    	for j in "M" "N" "A" "B" "C" "D" "X" "E" "F" "G" "H" "I" "J" "K" "L" ; do
        	echo "$i$j" >> time_check.txt
            echo "$i$j" >> empty_time.txt
  	done
done

if [ ! -e classname.txt ]; then
	sed 's/,/\
		/g' text.json | awk 'BEGIN {FS=":"} /cos_ename/ {printf("%s\n",$2)}' | sed 's/\"//g' | sed 's/ /_/g' > classname.txt
fi

if [ ! -e normal_table.txt ]; then
  normal_table
fi

timetable_status=0
conflict=0
while true ; do
	#display time table
	if [ "$timetable_status" -eq 0 ]; then #normal startup
		dialog --title "test" --ok-label "Add class" --extra-button --extra-label "Option" --help-button --help-label "Exit"  --textbox "normal_table.txt" 200 200
	elif [ "$timetable_status" -eq 1 ]; then #display classroom and small table
		dialog --extra-button --extra-label "Option" --ok-label "Add Class" --cancel-label "Exit" --yesno "classroom and small table" 200 200
	elif [ "$timetable_status" -eq 2 ]; then #display classname and large table
		dialog --extra-button --extra-label "Option" --ok-label "Add Class" --cancel-label "Exit" --yesno "classname and large table" 200 200
	else #display classname and large table
		dialog --extra-button --extra-label "Option" --ok-label "Add Class" --cancel-label "Exit" --yesno "classroom and large table" 200 200
	fi
	main_status=$?

	if [ "$main_status" -eq 0 ]; then #add class
		cp parsed.txt tmp.txt
		while [ $conflict -eq 0 ] ;do
			classes=$(cat parsed.txt)
			opt=$(dialog --output-fd 1 --title "Add class" --buildlist "Add class" 200 200 200 $classes)
			#if saved , write status into txt file
			if [ $? -eq 0 ]; then
				sed -i '' 's/ on/ off/g' parsed.txt
				for ln in $opt ; do
					sed -i '' "$ln s/ off/ on/g" parsed.txt
				done
			else
				mv tmp.txt parsed.txt
				break
			fi
			cat time_check.txt | awk '{printf("%s\n",$1)}' > time_check.tmp
			mv time_check.tmp time_check.txt
			#update available time
			for ln in $opt ; do
				out=$(sed -n "$ln p" time.txt)
				name=$(cat classname.txt | awk -v line=$ln '{if(NR==line) printf("%s",$1)}')
				for time in $out ; do
					cat time_check.txt | awk -v t=$time -v n=$name '{
						if($1==t)
							printf("%s %s\n",$0,n)
						else
							printf("%s\n",$0)}' > time_check.tmp
					mv time_check.tmp time_check.txt
				done
			done
			#check conflicted classes
			cat time_check.txt | awk '{if(NF>2) printf("%s\n",$0)}' > conflicted.txt
			if [ -s conflicted.txt ]; then
				dialog --title "ERROR! MULTIPLE CLASS SELECTED" --textbox conflicted.txt 200 200
				conflict=0
			else
				conflict=1
			fi
            make_table
		done
		conflict=0
	elif [ "$main_status" -eq 2 ]; then #exit
		break
	else #option main_status == 3
		dis_opt=$(dialog --output-fd 1 --checklist "Display Option" 200 200 200 \
			"1" "Check to display classroom" off \
			"2" "Check to display Sat. Sun. and NMXY" off)
		if [ $? -eq 0 ]; then
			timetable_status=0
			for ln in $dis_opt ; do
				timetable_status=$((ln + timetable_status))
		        done
			echo $timetable_status
		fi
	fi
done
