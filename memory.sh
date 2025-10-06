#!/bim/bash

usage=$( df -hT | grep -v Filesystem )
msg=''

while IFS= read -r line
do
  if [ $line -ge 0 ]
  then
    num=$($line |awk '{print $6F}' |cut -d "%" -f1)
    mount=$($line |awk '{print $7F}')
    msg+="hight on $mount : $line \n"
  fi 
done <<< $usage

echo $msg

#df -hT | grep -v Filesystem |awk '{print $6F}' |cut -d "%" -f1