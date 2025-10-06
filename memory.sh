#!/bim/bash

usage=$( df -hT | grep -v Filesystem |awk '{print $6F}' |cut -d "%" -f1)
count=0

while IFS= read -r line
do
    echo line 
    count+=1
done <<< $usage

echo $count