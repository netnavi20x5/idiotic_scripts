#secretly monitor ip from whom
cat /root/script/iploc.sh
echo "" >/root/log/ip_loc.log
for i in $(cat /root/log/ip.log);
do
curl ipinfo.io/$i >>/root/log/ip_loc.log
done
