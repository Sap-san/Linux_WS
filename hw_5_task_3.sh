#!/bin/bash

usage(){
	cat <<-EOF
		Cкрипт создаёт в указанной с помощью параметра -d директории указанные файлы. 
		Если файлы уже существуют, то выводится предупреждение на экран. 
		Если указано несколько директорий, то выводится ошибка с соответствущей информацией.

		Пример: ./script.sh -d /tmp/task_3 file1 file2.sh file3
EOF
}

while [ -n "$1" ] ; do

	case $1 in
		--help )
			usage ;;
		-d ) dir_name=$2
			shift 
			shift 
			while [[ $1 != -d ]] && [[ $# -gt 0 ]] ; do
				if [ -f $dir_name/$1 ]; then
					echo 'Файл уже существует!'
					usage
					exit 1
				elif [ -d $1 ]; then
					echo 'Указано несколько директорий подряд!'
					usage
					exit 2
				else
					touch $dir_name/$1
				fi				
				shift
			done;;
	esac
done