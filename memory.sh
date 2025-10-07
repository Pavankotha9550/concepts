#!/bim/bash

usage=$( df -hT | grep -v Filesystem )
msg=''
IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read -r line
do
    num=$(echo $line |awk '{print $6F}' |cut -d "%" -f1)
    mount=$(echo $line |awk '{print $7F}')
    if [ $num -gt 0 ]
    then
    msg+="high on $mount : $num \n"
  fi 
done <<< $usage

echo -e $msg

#df -hT | grep -v Filesystem |awk '{print $6F}' |cut -d "%" -f1

sh mailtemplate.sh "DevOps Team" "High Disk Usage" "$IP" "$msg" "pavanktha9550@gmail.com" "ALERT-High Disk Usage"