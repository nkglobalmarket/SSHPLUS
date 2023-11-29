#!/bin/bash
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-20s\n' "TCP Tweaker 1.0" ; tput sgr0
if [[ `grep -c "^#PH56" /etc/sysctl.conf` -eq 1 ]]
then
	echo ""
	echo "TCP WEAKER AYARLARI ZATEN SISTRMDE YUKLU!"
	echo ""
	read -p "TCP WEAKER AYARLARINI KALDIRMAK İSTİYORMUSUNUZUZ? [s/n]: " -e -i n resposta0
	if [[ "$resposta0" = 's' ]]; then
		grep -v "^#PH56
net.ipv4.tcp_window_scaling = 1
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 16384 16777216
net.ipv4.tcp_low_latency = 1
net.ipv4.tcp_slow_start_after_idle = 0" /etc/sysctl.conf > /tmp/syscl && mv /tmp/syscl /etc/sysctl.conf
sysctl -p /etc/sysctl.conf > /dev/null
		echo ""
		echo "TCP Tweaker KALDIRILDI."
		echo ""
	exit
	else 
		echo ""
		exit
	fi
else
	echo ""
	echo "Bu deneysel bir bölümdür risk size aittir!"
	echo "Bu komut dosyası bazı ayarları degistiricek"
	echo "do sistema para reduzir a latência e melhorar a velocidade."
	echo ""
	read -p "devam etmek istiyormusunuz? [s/n]: " -e -i n resposta
	if [[ "$resposta" = 's' ]]; then
	echo ""
	echo "Modificando as seguintes configurações:"
	echo " " >> /etc/sysctl.conf
	echo "#PH56" >> /etc/sysctl.conf
echo "net.ipv4.tcp_window_scaling = 1
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 16384 16777216
net.ipv4.tcp_low_latency = 1
net.ipv4.tcp_slow_start_after_idle = 0" >> /etc/sysctl.conf
echo ""
sysctl -p /etc/sysctl.conf
		echo ""
		echo "AG AYARLARI BASARILI BIR SEKILDE GUNCELLENDI."
		echo ""
	else
		echo ""
		echo "Kurulum kullanıcı tarafından iptal edildi!"
		echo ""
	fi
fi
exit