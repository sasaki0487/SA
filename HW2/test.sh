awk '{
	split($2,chars, "")
	printf("%s",NR)
	for(i=1 ; i < length($2) ; i++){
		if(chars[i]=="-") break
		if(chars[i]~/[0-9]/)
			num=chars[i]
		else
			printf("%s%s ",num,chars[i])
	}
	printf("\n")
}' < parsed.txt
