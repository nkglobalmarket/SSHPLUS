#!/bin/bash

echo "NK MARKET SETUP"
echo "Bu script, nkmarketvip.sh dosyasını indirip kaydedecek."

read -p "Devam etmek istiyor musunuz? (Evet/Hayir): " response

if [[ $response =~ ^[EeYy]$ ]]; then
    wget https://raw.githubusercontent.com/nkglobalmarket/SSHPLUS/master/nkmarketvip.sh -O nkmarketvip.sh
    chmod +x nkmarketvip.sh
    echo "nkmarketvip.sh dosyası başarıyla indirildi ve kaydedildi."
    echo "Artık 'nkmarketvip' komutunu kullanabilirsiniz."
else
    echo "İşlem iptal edildi. Script kapatılıyor."
fi