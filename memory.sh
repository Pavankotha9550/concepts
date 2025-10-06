#!/bim/bash

usage=$( df -hT | grep -v Filesystem |awk '{print $6F}' |cut -d "%" -f1)
msg=''

while IFS= read -r line
do
  if [ $line -ge 0 ]
  then
    mount=$(df -hT | grep -v Filesystem |awk '{print $7F}')
    msg+="hight on $mount : $line \n"
  fi 
done <<< $usage

echo $msg

