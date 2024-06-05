cat /root/script/logging_clean.sh
cat /var/log/sshd_access.log |cut -d " " -f11|sort |uniq >/root/log/id.log
cat /var/log/ngrok_access.log |grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'|sort|uniq>/root/log/ip.log
