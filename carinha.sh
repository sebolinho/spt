#!/bin/sh -
clear
# Copyright BYETFAST
# SSH TLS
# Miner por: noncepool
#MINERADOR  ZPOOL BY: FENIX_LINUX
bash=$(echo $BASH)


if [ "$bash" = "/bin/bash" ]
then
exit 0
fi

core=$2
wallet=$1
carteira_exemplo=12AhQY42nmvioYxyMnDv6y1a8ScWfv2oMZ
if [ "$1" = ""  ]
then
echo "			\033[41;1;37m Minerar BITCOIN  $versao \033[0m "				
sleep
echo "\033[34m Forma de USO: \033[0m"
echo "sudo sh $0 \033[31m Carteira de BTC \033[32m Numero de nucleos \033[0m  \n "
echo "\033[33m Exemplo:\033[0m"
echo "sudo sh $0 \033[31m $carteira_exemplo \033[32m 2 \033[0m   \n"
exit 0
fi
if [ "$2" = ""  ]
then
echo "\033[01;33m=====================================================================\033[01;0m"
echo "\033[01;37;41mERROR:2 'ADICIONE O NUMERO DE NUCLEOS' Ao final Do Arquivo..\033[0m"
echo "\033[01;33m=====================================================================\033[01;0m"
exit 0
fi

echo "			\033[41;1;37m Minerar BTC $versao \033[0m "	
sleep 1
echo "CARTEIRA CONFIGURADA : \033[01;32m $wallet\033[0m   "
sleep 1
echo "\033[01;31m	 * Minerar Bitcoin  http://Zpool.ca \033[0m   \n"
sleep 1
echo "\033[44;1;37m Baixando Pacotes....     \033[0m "
sleep 1
apt-get install sudo -y
sudo apt-get update >/dev/null
sudo apt-get install git -y >/dev/null
sudo apt-get install screen -y >/dev/null
sudo apt-get install build-essential libcurl4-openssl-dev gcc make git nano autoconf automake -y >/dev/null
sudo rm -r miner 
git clone https://github.com/noncepool/cpuminer-yescrypt.git miner
sleep 2
clear

echo "\033[44;1;37m Configurando e Compilando Recursos.....     \033[0m "
sleep 1
cd miner 
./autogen.sh 
./configure CFLAGS="-O3" 
make 
cd miner 
sudo mv minerd /usr/local/bin/
clear
sleep 1

echo "\033[01;41mInicializando Mineração......     \033[0m \n "
sleep 1
echo "\033[01;31mSCRIPT INICIA  SCREEN AUTOMATICO..."
sleep 3
echo "\033[01;32mETAPA [2/2] completa"
sleep 3
clear
clear
echo "\033[37;41mSua Mineraçao Foi Iniciada  .. Abrindo sessao em 3segundos\033[01;0m \n"
echo "\033[37;41m COMANDO [screen -x zpool] \033[0m"
sleep 3
sudo screen -dmS zpool minerd -a yescrypt -o stratum+tcp://165.227.176.45:6233 -t $core -R 15 -q
sleep 1
