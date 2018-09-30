#check if raw and parsed timetable exits
if [ ! -e parsed.txt ]; then
	if [ ! -e text.json ]; then
		curl 'https://timetable.nctu.edu.tw/?r=main/get_cos_list' --data 'm_acy=107&m_sem=1&m_degree=3&m_dep_id=17&m_group=**&m_grade=**&m_class=**&m_option=**&m_crsname=**&m_teaname=**&m_cos_id=**&m_cos_code=**&m_crstime=**&m_crsoutline=**&m_costype=**’' >> text.json
	fi
	sed 's/,/\
	/g' text.json | awk 'BEGIN {FS=":"} /cos_id|cos_time|cos_ename/ {print $2}' > parsed.txt
fi

#http://www.ttlsa.com/linux-command/linux-dialog-shell/ for fialog reference
