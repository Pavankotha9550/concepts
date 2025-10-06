#!/bim/bash

usage=$( df -hT | grep -v Filesystem |awk '{print $6F}' |cut -d "%" -f1)
msg=''

while IFS= read line
do
    if [ $line -ge 1 ]
    then
        mount=$(df -hT | grep -v Filesystem |awk '{print $7F}')
        msg+= "high dish usage on $mount: $usage \n"
    fi
done <<< $usage

echo $msg