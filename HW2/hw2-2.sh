time=
txt=
make_table() {
    normal_table
    name_large_table
    room_small_table
    room_large_table
}

normal_table(){
    cp time_check.txt normal_table.txt
    sed -E -i '' 's/_/ /g' normal_table.txt
    sed -E -i '' 's/[1-9][A-Z]|[1-9][A-Z] //' normal_table.txt
    sed -E -i '' 's/(.{13})/\1\,/g' normal_table.txt
    awk 'BEGIN {FS=","} {for(i=1;i<=NF;i++) printf("%-13s,",$i)} {printf("\n")}' normal_table.txt > tmp.txt
    paste -d"," empty_time.txt tmp.txt > tmp2.txt
    sed -E -i '' '/[1-9][LNMXY],/d' tmp2.txt
    sed -E -i '' '/[67][A-Z],/d' tmp2.txt
    cp tmp2.txt normal_table.txt
    rm tmp.txt
    txt="normal_table.txt"
    echo "x  .Mon          .Tue          .Wed          .Thr          .Fri              " >> out.txt
    for time in "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" ; do
        string_gen
        echo "=  ============== ============= ============= ============= ============= =" >> out.txt
    done
    mv out.txt normal_table.txt
}

name_large_table(){
    cp time_check.txt name_large_table.txt
    sed -E -i '' 's/_/ /g' name_large_table.txt
    sed -E -i '' 's/[1-9][A-Z]|[1-9][A-Z] //' name_large_table.txt
    sed -E -i '' 's/(.{13})/\1\,/g' name_large_table.txt
    awk 'BEGIN {FS=","} {for(i=1;i<=NF;i++) printf("%-13s,",$i)} {printf("\n")}' name_large_table.txt > tmp.txt
    paste -d"," empty_time.txt tmp.txt > tmp2.txt
    cp tmp2.txt name_large_table.txt
    rm tmp.txt
    txt="name_large_table.txt"
    echo "x  .Mon          .Tue          .Wed          .Thr          .Fri          .Sat          .Sun               " >> out.txt
    for time in "M" "N" "A" "B" "C" "D" "X" "Y" "E" "F" "G" "H" "I" "J" "K" "L"; do
        string_gen_long
        echo "=  ============== ============= ============= ============= ============= ============= ============= =" >> out.txt
    done
    mv out.txt name_large_table.txt
}

room_small_table(){
    cp room_check.txt room_small_table.txt
    sed -E -i '' 's/_/ /g' room_small_table.txt
    sed -E -i '' 's/[1-9][A-Z]|[1-9][A-Z] //' room_small_table.txt
    sed -E -i '' 's/(.{13})/\1\,/g' room_small_table.txt
    awk 'BEGIN {FS=","} {for(i=1;i<=NF;i++) printf("%-13s,",$i)} {printf("\n")}' room_small_table.txt > tmp.txt
    paste -d"," empty_time.txt tmp.txt > tmp2.txt
    sed -E -i '' '/[1-9][LNMXY],/d' tmp2.txt
    sed -E -i '' '/[67][A-Z],/d' tmp2.txt
    cp tmp2.txt room_small_table.txt
    rm tmp.txt
    txt="room_small_table.txt"
    echo "x  .Mon          .Tue          .Wed          .Thr          .Fri              " >> out.txt
    for time in "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" ; do
        string_gen
        echo "=  ============== ============= ============= ============= ============= =" >> out.txt
    done
    mv out.txt room_small_table.txt
}

room_large_table(){
    cp room_check.txt room_large_table.txt
    sed -E -i '' 's/_/ /g' room_large_table.txt
    sed -E -i '' 's/[1-9][A-Z]|[1-9][A-Z] //' room_large_table.txt
    sed -E -i '' 's/(.{13})/\1\,/g' room_large_table.txt
    awk 'BEGIN {FS=","} {for(i=1;i<=NF;i++) printf("%-13s,",$i)} {printf("\n")}' room_large_table.txt > tmp.txt
    paste -d"," empty_time.txt tmp.txt > tmp2.txt
    cp tmp2.txt room_large_table.txt
    rm tmp.txt
    txt="room_large_table.txt"
    echo "x  .Mon          .Tue          .Wed          .Thr          .Fri          .Sat          .Sun               " >> out.txt
    for time in "M" "N" "A" "B" "C" "D" "X" "Y" "E" "F" "G" "H" "I" "J" "K" "L"; do
        string_gen_long
        echo "=  ============== ============= ============= ============= ============= ============= ============= =" >> out.txt
    done
    mv out.txt room_large_table.txt
}

string_gen(){
    ln=$(cat "$txt" | awk -v row="1$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str1=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str2=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str3=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str4=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    ln=$(cat "$txt" | awk -v row="2$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str5=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str6=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str7=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str8=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    ln=$(cat "$txt" | awk -v row="3$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str9=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str10=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str11=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str12=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    ln=$(cat "$txt" | awk -v row="4$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str13=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str14=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str15=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str16=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    ln=$(cat "$txt" | awk -v row="5$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str17=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str18=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str19=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str20=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    echo "$time  |$str1|$str5|$str9|$str13|$str17 |" >> out.txt
    echo ".  |$str2|$str6|$str10|$str14|$str18 |" >> out.txt
    echo ".  |$str3|$str7|$str11|$str15|$str19 |" >> out.txt
    echo ".  |$str4|$str8|$str12|$str16|$str20 |" >> out.txt
}

string_gen_long(){
    ln=$(cat "$txt" | awk -v row="1$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str1=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str2=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str3=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str4=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    ln=$(cat "$txt" | awk -v row="2$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str5=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str6=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str7=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str8=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    ln=$(cat "$txt" | awk -v row="3$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str9=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str10=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str11=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str12=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    ln=$(cat "$txt" | awk -v row="4$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str13=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str14=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str15=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str16=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    ln=$(cat "$txt" | awk -v row="5$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str17=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str18=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str19=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str20=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    ln=$(cat "$txt" | awk -v row="6$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str21=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str22=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str23=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str24=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    ln=$(cat "$txt" | awk -v row="7$time" 'BEGIN{FS=","} {if($1~row){for(i=2;i<NF;i++)printf("%s,",$i)}}')
    str25=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($1)==13){print $1} else {print "x.           "}}')
    str26=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($2)==13){print $2} else {print ".            "}}')
    str27=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($3)==13){print $3} else {print ".            "}}')
    str28=$(echo "$ln" | awk 'BEGIN {FS=","} { if(length($4)==13){print $4} else {print ".            "}}')

    echo "$time  |$str1|$str5|$str9|$str13|$str17|$str21|$str25 |" >> out.txt
    echo ".  |$str2|$str6|$str10|$str14|$str18|$str22|$str26 |" >> out.txt
    echo ".  |$str3|$str7|$str11|$str15|$str19|$str23|$str27 |" >> out.txt
    echo ".  |$str4|$str8|$str12|$str16|$str20|$str24|$str28 |" >> out.txt
}

#show available classes and display
show_available_class(){
    lncount=$(cat time.txt | wc -l)

    rm -f available.txt
    for num in $(seq 1 $lncount)
    do
        ln=$(sed -n "$num p" time.txt)
        for time in $ln ; do
            res=$(cat time_check.txt | awk -v t=$time '{if($1==t){
                    if(NF==1) printf("1")
                    else printf("0")
                }
            }')
            if [ $res -eq 0 ]; then
                break
            fi
        done
        if [ $res -ne 0 ]; then
            sed -n "$num p" parsed.txt | awk '{if($3!=on)print $2}' >> available.txt
        fi
    done
    dialog --title "Available Classes" --textbox available.txt 200 200
}

#search with classtime and classname
search(){
    rm -f search_result.txt
    key=$(dialog --inputbox "ENTER CLASSNAME OR TIME" 200 200 3>&1 1>&2 2>&3 3>&-)
    cat parsed.txt | grep -i "$key" | awk '{print $2}' >> search_result.txt
    dialog --title "Search Result" --textbox search_result.txt 200 200
}

# check if raw and parsed timetable exits
if [ ! -e parsed.txt ]; then
	if [ ! -e text.json ]; then
		curl 'https://timetable.nctu.edu.tw/?r=main/get_cos_list' --data 'm_acy=107&m_sem=1&m_degree=3&m_dep_id=17&m_group=**&m_grade=**&m_class=**&m_option=**&m_crsname=**&m_teaname=**&m_cos_id=**&m_cos_code=**&m_crstime=**&m_crsoutline=**&m_costype=**??' >> text.json
	fi
	sed 's/,"/\
		/g' text.json | awk 'BEGIN {FS=":"} /cos_time/ {s1=$2} /cos_ename/ {printf("%s %s\n",s1,$2)}' | sed 's/\"//g' | sed 's/ /_/g' | awk 'BEGIN{n=0} {n++;printf("%s %s off \n",n,$1)}' > parsed.txt
fi

# generate the time of classes
if [ ! -e time.txt ]; then
	cat parsed.txt | awk '{
		split($2,chars, "")
		for(i=1;i<length($2);i++){
            if(chars[i]=="-"){
                while(chars[i]!="," && chars[i]!="_"){
                    i++;
                }
                if(chars[i]=="_") break;
                else i++;
            }
            if(chars[i]~/[0-9]/) num=chars[i]
			else printf("%s%s ",num,chars[i])
		}
		printf("\n")
	}' > time.txt
fi

# generate the file for checking class confliction
if [ ! -e time_check.txt ]; then
    for i in 1 2 3 4 5 6 7 ; do
    	for j in "M" "N" "A" "B" "C" "D" "X" "Y" "E" "F" "G" "H" "I" "J" "K" "L" ; do
            echo "$i$j" >> time_check.txt
  	    done
    done
fi

# generate the file for time -> classroom
if [ ! -e room_check.txt ]; then
    for i in 1 2 3 4 5 6 7 ; do
    	for j in "M" "N" "A" "B" "C" "D" "X" "Y" "E" "F" "G" "H" "I" "J" "K" "L" ; do
            echo "$i$j" >> room_check.txt
  	    done
    done
fi

# generate empty time file from 1M to 7L
if [ ! -e empty_time.txt ]; then
    for i in 1 2 3 4 5 6 7 ; do
    	for j in "M" "N" "A" "B" "C" "D" "X" "Y" "E" "F" "G" "H" "I" "J" "K" "L" ; do
            echo "$i$j" >> empty_time.txt
    	done
    done
fi

# generate a file which contains only classname
if [ ! -e classname.txt ]; then
	sed 's/,/\
		/g' text.json | awk 'BEGIN {FS=":"} /cos_ename/ {printf("%s\n",$2)}' | sed 's/\"//g' | sed 's/ /_/g' > classname.txt
fi

# generate a file which contains only classroom
if [ ! -e classroom.txt ]; then
    sed 's/,"/\
        /g' text.json | awk 'BEGIN {FS=":"} /cos_time/ {printf("%s\n",$2)}' | sed 's/\"//g' | awk -F'[-,]' '{for(i=2;i<=NF;i+=2) printf("%s",$i)} {printf("\n")}' > classroom.txt
fi

#generate timetable status
if [ ! -e status.txt ];then
    echo 0 > status.txt
fi

# ====== generate time tables ====== #
if [ ! -e normal_table.txt ]; then
    normal_table
fi

if [ ! -e name_large_table.txt ]; then
    name_large_table
fi

if [ ! -e room_small_table.txt ]; then
    room_small_table
fi

if [ ! -e room_large_table.txt ]; then
    room_large_table
fi

# ================================== #

# ====== main function ====== #

timetable_status=$(cat status.txt)
conflict=0

while true ; do
    # ====== display time table ====== #

	if [ "$timetable_status" -eq 0 ]; then #normal startup
		dialog --title "test" --ok-label "Add class" --extra-button --extra-label "Option" --help-button --help-label "Exit"  --textbox "normal_table.txt" 200 200
	elif [ "$timetable_status" -eq 1 ]; then #display classroom and small table
		dialog --title "test" --ok-label "Add class" --extra-button --extra-label "Option" --help-button --help-label "Exit"  --textbox "room_small_table.txt" 200 200
	elif [ "$timetable_status" -eq 2 ]; then #display classname and large table
		dialog --title "test" --ok-label "Add class" --extra-button --extra-label "Option" --help-button --help-label "Exit"  --textbox "name_large_table.txt" 200 200
	else #display classname and large table
		dialog --title "test" --ok-label "Add class" --extra-button --extra-label "Option" --help-button --help-label "Exit"  --textbox "room_large_table.txt" 200 200
	fi
	main_status=$?
    # ====== add class choosed ====== #
	if [ "$main_status" -eq 0 ]; then
		cp parsed.txt tmp.txt
		while [ $conflict -eq 0 ] ;do
			classes=$(cat parsed.txt)
			opt=$(dialog --output-fd 1 --title "Add class" --buildlist "Add class" 200 200 200 $classes)
			# if saved , write status into txt file
			if [ $? -eq 0 ]; then
				sed -i '' 's/ on/ off/g' parsed.txt
				for ln in $opt ; do
					sed -i '' "$ln s/ off/ on/g" parsed.txt
				done
			else
				mv tmp.txt parsed.txt
				break
			fi
			cp empty_time.txt time_check.txt
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
            #update classroom info
            cp empty_time.txt room_check.txt
			for ln in $opt ; do
				out=$(sed -n "$ln p" time.txt)
				name=$(cat classroom.txt | awk -v line=$ln '{if(NR==line) printf("%s",$1)}')
				for time in $out ; do
					cat room_check.txt | awk -v t=$time -v n=$name '{
						if($1==t)
							printf("%s %s\n",$0,n)
						else
							printf("%s\n",$0)}' > room_check.tmp
					mv room_check.tmp room_check.txt
				done
			done
            make_table
		done
		conflict=0
    # ====== exit choeesed ====== #
	elif [ "$main_status" -eq 2 ]; then
		break
    # ====== option choosed ====== #
	else
		dis_opt=$(dialog --output-fd 1 --title "OPTION MENU" --menu "Select Option" 200 200 200 \
			"0" "Display classname and hide extra column"  \
			"1" "Display classroom and hide extra column"  \
            "2" "Display classname and show extra column"  \
            "3" "Display classroom and show extra column"  \
            "4" "Show available classes that haven't been chosen" \
            "5" "Search classname or classtime")
		if [ $? -eq 0 ]; then
		    if [ "$dis_opt" -eq 4 ]; then
                show_available_class
            elif [ "$dis_opt" -eq 5 ]; then
                search
            else
                timetable_status=$dis_opt
                echo $dis_opt > status.txt
            fi
		fi
	fi
done
