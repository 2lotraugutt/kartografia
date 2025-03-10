IFS=$'\n'
for i in $(grep -E '([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}' ipaddr.tsv)
do
  ip=$(echo $i|awk '{print $1}')
  newmac=10:00:00:00:00:01
  newline=$(echo $i | sed -E "s/([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}/$newmac/")
  sed -i "s/$i/$newline/" ipaddr.tsv
done
