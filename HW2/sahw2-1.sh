ls -AlR | sort -nrk 5 | awk 'BEGIN{f=0;d=0;s=0;l=0} /^-/ {s+=$5; f++; if(l<6)print ++l":\t"$5"\t"$9} /^d/ {d++} END {printf("DIR NUM : %s\nFILE NUM: %s\nTOTAL SIZE: %s \n",d,f,s)}'

