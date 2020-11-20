#!/bin/bash
clear
echo "Create New SSH & VPN Account"
echo "============================"
echo
echo -n "Masukkan Username: "
read account
echo -n "Masukkan Password [$account]: "
read pass
echo -n "Masa Aktif (hari): "
read exp
host=$( hostname )
country=$( wget -qO- https://get.geojs.io/v1/ip/country/full )
useradd -e `date -d "$exp days" +"%Y-%m-%d"` -g users -s /bin/false -M $account
expire="$(chage -l $account | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$pass\n$pass\n"|passwd $account &> /dev/null
clear
echo "Silahkan akunnya sudah jadi"
echo
echo -e "Hostname: $host"
echo -e "Username: $account "
echo -e "Password: $pass"
echo -e "Lokasi: $country"
echo -e "Aktif Selama: $exp Hari"
echo -e "Expired Pada: $expire"
echo -e "SSL/TLS Port: 443, 80"
echo -e "SSH Port: 110, 109, 143"
echo
