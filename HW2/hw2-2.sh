if [ ! -e text.json ]; then
	echo "error"
else
	echo "exist"
fi

sed 's/,/\
/g' text.json > parsed.txt
