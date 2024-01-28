#!/bin/bash

# Verifica se o hping3 está instalado
if ! command -v hping3 &> /dev/null
then
    echo "hping3 não está instalado. Por favor, instale-o antes de continuar."
    exit
fi

# Verifica se foram informados a rede e a porta
if [ "$1" == "" ] || [ "$2" == "" ]
then
	echo "PortScan"
	echo "Modo de uso: script.sh REDE PORTA"
	echo "Exemplo: script.sh 192.168.0 22"
	exit
fi

# Verifica se a porta informada é um número válido
if ! [[ "$2" =~ ^[0-9]+$ ]]
then
    echo "A porta informada não é um número válido."
    exit
fi

echo "Iniciando scan em $1.$2..."

for ip in {1..254};
do
    hping3 -S -p $2 -c 1 $1.$ip 2>/dev/null | grep "flags=SA" | cut -d " " -f 2;
done

echo "Scan finalizado."
