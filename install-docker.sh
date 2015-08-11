#!/bin/bash
# 'which' retorna el path de su argumento
# $? es el último exit status

which docker > /dev/null
if [ "$?" != "0" ]; then
	echo No se ha encontrado Docker. Instalandocon wget...
	which wget > /dev/null
    if [ "$?" != "0" ]; then
    	echo Instalando wget...
    	apt-get install -y wget
    	if [ "$?" != "0" ]; then
    		echo No se ha encontrado wget en los repositorios. Actualizando repositorios...
    		apt-get update > /dev/null
    		echo Instalando wget...
    		apt-get install -y wget
    	fi
    fi
    if [ "$?" == "0" ]; then
    	echo Instalando Docker...
    	wget -qO- https://get.docker.com/ | sh
    fi
else
	echo Docker ya se encuentra en su sistema.
fi
