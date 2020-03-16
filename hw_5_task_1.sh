#!/bin/bash

usage(){
	cat <<-EOF
		Cкрипт удаляет из текстового файла пустые строки и заменяет маленькие символы на большие.
		Нужно передать путь к файлу как параметр.
		Пример: ./script.sh ./test/file1
EOF
}

if (( $# < 1)) ; then
	echo 'Недостаточно параметров.'
	usage
	exit 1
else
	case $1 in
		--help )
		usage 
		exit 0 ;;
		* )
		sed -i -e '/^[ \t]*$/d' -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' $1 ;;
	esac	
fi