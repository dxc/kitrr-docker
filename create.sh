#!/bin/bash
docker build -t krr krr
if [ "$?" != "0" ]; then
	echo Error al construir la imagen del Kit de Respuesta Rápida. Abortado.
	exit 1
fi

docker build -t pf pf
if [ "$?" != "0" ]; then
	echo Error al construir la imagen del Person Finder. Abortado.
	exit 1
fi

docker create --name krr -p 8000:8000 krr
if [ "$?" != "0" ]; then
	echo Error al construir el contenedor del Kit de Respuesta Rápida. Abortado.
	exit 1
else
	echo El contenedor del Kit de Respuesta Rápida ha sido creado. Escuchará el puerto 8000.
fi

docker create --name pf -p 8001:8001 pf
if [ "$?" != "0" ]; then
	echo Error al construir el contenedor del Person Finder. Abortado.
	exit 1
else
	echo El contenedor del Person Finder ha sido creado. Escuchará el puerto 8001.
fi
