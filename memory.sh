#!/bim/bash

usage=$( df -hT | grep -v Filesystem )
msg=''

while IFS= read -r line
do
    num=$(echo $line |awk '{print $6F}' |cut -d "%" -f1)
    mount=$(echo $line |awk '{print $7F}')
    if [ $num -ge 0 ]
    then
    msg+="hight on $mount : $num \n"
  fi 
done <<< $usage

echo -e $msg

#df -hT | grep -v Filesystem |awk '{print $6F}' |cut -d "%" -f1