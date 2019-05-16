#!/bin/bash


#if [[ $EUID -ne 0 ]]
#then
#echo -e "El usuario NO es root, por lo que no se permite ejecutar el script"
#exit 1
#fi

if [ -z $1 ]
then
  echo "falta opcion"
exit 1
elif [ -n $1 ]
then
# otherwise make first arg as a rental
  opcion=$1
fi

if [ -z $2 ]
then
  echo "falta usuario"
exit 1
elif [ -n $2 ]
then
# otherwise make first arg as a rental
  usuario=$2
fi

      case  $opcion  in
		"-d") echo "$usuario ha sido eliminado"
			userdel -f $usuario ;;
		"-r") echo "La carpeta home de $usuario ha sido eliminada"
		 rm -r /home/$usuario;;
		"-a") echo "La carpeta home de $usuario ha sido modificada"
			if [ ! -d "/archives" ]
			then
			mkdir -p /archives
			fi
			tar -czf $usuario.tar.gz /home/$usuario/;;
			#mv /home/$usuario/$usuario.tar.gz /archives;;
		*)    echo "no se ha encontrado la función";;

     esac
