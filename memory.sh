#!/bim/bash

usage=$( df -hT | grep -v Filesystem |awk '{print $6F}' |cut -d "%" -f1)
msg=''

while IFS= read line
do
    if [ $line -gt 1 ]
    then
        mount=$(grep -v Filesystem |awk '{print $7F}')
        msg+= $mount: $usage
    fi
done <<< $usage

echo -e "high memory utilization on $msg \n"