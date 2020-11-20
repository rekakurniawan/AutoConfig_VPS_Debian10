#!/bin/bash
#Script untuk menghapus user
clear
echo "==== HAPUS USER ===="
read -p "Username: " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna
        echo -e "Username $Pengguna telah dihapus."
else
        echo -e "Gagal menghapus: Username $Pengguna tidak ada diserver."
fi
