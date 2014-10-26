#!/bin/bash
#Crtl C trap
ctrl_c()
{
  echo -en "\n*** Exiting. Thank you for your support. ***\n"
  exit $?
}
trap ctrl_c SIGINT
#Read in last read tweet id
while read line
do
    last=$line
done <lastreadtweetid.txt
echo 'Starting with' $last
#Main loop
while true; do
  declare -a fool=( $(t timeline astropacket -l -s $last | grep -i '#NOISIS' | awk '{twid=$1; for (i=6; i<NF; i++) {if ($i ~ /^@/) {uname=substr($i,2); break}}; printf("%s\t%s\n", twid, uname); uname=""}') )
  if [ -z "${fool[1]}" ]; then
    sleep 39
  else
	echo 'Block and Report Spam' ${fool[1]}
    last=${fool[0]}
    echo $last > lastreadtweetid.txt
    echo 'Set new last read' $last
    t report_spam ${fool[1]}
    unset ${fool[1]}
    sleep 39
  fi  
done
