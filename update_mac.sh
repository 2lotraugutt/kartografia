[ -z "$1" ] && echo Usage: update_mac.sh arp-scan.txt ipaddr.tsv && exit
[ -z "$2" ] && echo Usage: update_mac.sh arp-scan.txt ipaddr.tsv && exit

cp $2 $2.back
IFS=$'\n'
for i in $(grep -E '([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}' $2)
do
  rip=$(echo "$i"|awk -v FS='\t' '{print $1}')
  ip=$(echo "$i"|awk -v FS='\t' '{print $1}'|sed 's/\./\\\./g' | sed 's/.*/\\b\0\\b/')
  [ -z $ip ] && continue
  newmac=$(cat $1 | grep "$ip" | awk '{print $2}' | tr -d ' \t')
  [ -z "$newmac" ] && echo "[-] Not found mac for $rip" && continue
  newline=$(echo $i | sed -E "s/([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}/$newmac/")
  sed -i "s/$i/$newline/" $2
done
