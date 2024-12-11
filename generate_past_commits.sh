#!/bin/bash
DAYS=30
FILE="fake.txt"
for ((i=0; i<=DAYS; i++))
do
	DATE=$(date -d "$i days ago" "+%Y-%m-%d")
	for j in 1 2
	do
		TIME=$(date -d "$((random % 12 +8)):$(shuf -i 0-59 -n 1)" "+%H:%M:%S")
		COMMIT_DATE="$DATE $TIME"

		echo "modification jour $i commit $j" >> $FILE

		git add $FILE
		GIT_COMMITER_DATE="$COMMIT_DATE" git commit --date "$COMMIT_DATE" -m "commit numero $i - $j"
		echo "############################"
		echo "success"
		echo "###########################"
	done
done
echo "succes auto"

