# crontab 
# * * * * * sh /root/security/script/monitor_ip.sh
me=$(basename "$0")
workingpath=/root/security
logpath=$workingpath/log
scriptpath=$workingpath/script

if [ ! -d "$workingpath" ]; then
    mkdir -p "$workingpath"
    echo "Directory '$workingpath' created."
else
    echo "Directory '$workingpath' already exists."
fi

if [ ! -d "$logpath" ]; then
    mkdir -p "$logpath"
    echo "Directory '$logpath' created."
else
    echo "Directory '$logpath' already exists."
fi

if [ ! -d "$scriptpath" ]; then
    mkdir -p "$scriptpath"
    echo "Directory '$scriptpath' created."
    cp $me $scriptpath/$me
else
    echo "Directory '$scriptpath' already exists."
fi

 /usr/sbin/ss -t|awk '{print $4,$5}'|sort -u >> $logpath/monitor_ip.txt
sort -u $logpath/monitor_ip.txt -o $logpath/monitor_ip.txt

cat $logpath/monitor_ip.txt |awk '{print $2}'|grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' -o|sort -u >>$logpath/iponly.txt
sort -u $logpath/iponly.txt -o $logpath/iponly.txt
