/root/script/logging.sh

# cat /root/script/logging.sh
#nohup journalctl _COMM=ngrok -f -n 1|grep "r=" >>/var/log/ngrok_access.log &
#nohup journalctl _COMM=sshd -f |grep "password"|grep invalid >> /var/log/sshd_access.log  &
journalctl _COMM=ngrok --since "1 hour ago" |grep "r=" >>/var/log/ngrok_access_hourly.log
journalctl _COMM=sshd --since "1 hour ago"  |grep "password"|grep invalid >> /var/log/sshd_access.log
