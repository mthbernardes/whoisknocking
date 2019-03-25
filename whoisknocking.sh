#!/bin/bash

logfile="/var/log/iptables.log"
echo "WhoIsKnocking - Port Scan Monitor"

function parse(){
  read -r line
  IFS=' ' read -r -a array <<< "$line"
  for value in "${array[@]:7}";do
    regex="([A-Z]+)=([a-zA-Z0-9]+)"
    if [[ "$value" =~ "$regex" ]];then
      export $value
    fi
  done
  echo -e "$IN\t\t\t$PROTO\t\t\t$SRC\t\t$DST\t\t$DPT"  
}
echo -e "INTERFACE\t\tPROTOCOL\t\tSOURCEIP\t\tDESTINATIONIP\t\tDESTINATIONPORT"
while inotifywait -q -e modify "$logfile" > /dev/null; do
  tail -n1 "$logfile" | parse
done
