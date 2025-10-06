#!/bim/bash

usage=$( df -hT | grep -v Filesystem |awk '{print $6F}' |cut -d "%" -f1)
msg=''

while IFS= read -r line
do
  echo $line  
done <<< $usage

