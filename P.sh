#!/bin/bash

if [[ $EUID -ne 0 ]]
then
echo -e "El usuario NO es root, por lo que no se permite ejecutar el script"
exit 1
fi

echo -e "\n"
echo "Ingrese el nombre para el nuevo usuario: " #Pedir el nombre de usuario
read nombre
if [ "$nombre" == "" ] ; then
clear
echo -e "\n"
echo "El nombre no puede estar vacío"
echo -e "\n"
exit 1
fi

echo -e "\n"
echo "Ingrese el nombre completo:" #Introducir nombre de usuario en la descripción.
read nombrec
if [ "$nombrec" == "" ] ; then
clear
echo -e "\n"
echo "El nombre no puede estar vacío"
echo -e "\n"
exit 1
fi

echo -e "\n"
echo "Ingrese el home directory (default /home/$nombre): " #Crear directorio para el usuario
read home
if [ "$home" == "" ] ; then
home="/home/$nombre"
fi

echo -e "\n"
read -s -p "Ingrese la contraseña del usuario : " password
if [ "$password" == "" ] ; then
clear
echo -e "\n"
echo "La contraseña no puede estar vacía"
echo -e "\n"
exit 1
fi

pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
useradd -m -p $pass -c $nombrec -d /home/$nombre $nombre
chage -d 0 $nombre


echo "Los datos ingresados son los siguientes:"
echo "****************************************"
echo -e "\n"
echo "Nombre completo: $nombrec"
echo "Nombre del usuario: $nombre"
echo "Directorio home: $home"
echo "la contraseña es: $password"
echo "El usuario fue creado satisfactoriamente"
host=`hostname`
echo "El host desde el que se ha creado es: $host"
