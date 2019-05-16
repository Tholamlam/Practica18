#!/bin/bash

if [ $(id -u) -eq 0 ]; then

if [ -z $1 ]
then
echo "falta opcion"
exit 1
elif [ -n $1 ]
then
  opcion=$1
fi

if [ -z $2 ]
then
  echo "falta usuario"
exit 1
elif [ -n $2 ]
then
  usuario=$2
fi
      case  $opcion  in
		"-d")  echo "$usuario ha sido eliminado"
			userdel -f $usuario;;
		"-r") echo "La carpeta home de $usuario ha sido eliminada"
		 rm -r /home/$usuario;;
		"-a") echo "La carpeta home de $usuario ha sido copiada a archives"
			if [ ! -d "/archives" ]
			then
			mkdir -p /archives
			fi
			tar -czf $usuario.tar.gz /home/$usuario
			mv /home/ausias/Escriptori/$usuario.tar.gz /archives/;;
		"-l") echo "Usuario deshabilitado"
			usermod -L -e 1 $usuario;;
		*)    echo "no se ha encontrado la función";;

     esac
else
  echo "Solo el root del sistema puede hacer modificacioness"
  exit 3
fi

