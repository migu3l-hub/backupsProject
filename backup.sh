#!/bin/bash

usuario="migue"
password="Manchas123"
dominio="192.168.88.4"

log="logbackup.txt"

# Delete all the direct access
find . -name "*.lnk" -type f >> $log
find . -name "*.lnk" -type f -delete

# What to backup.
backup_files="$(pwd)/Desktop $(pwd)/Documents $(pwd)/Downloads $(pwd)/Music $(pwd)/Videos $(pwd)/Pictures"
# backup_files="$(pwd)/Escritorio $(pwd)/Documentos $(pwd)/Descargas $(pwd)/Musica $(pwd)/Videos $(pwd)/Imagenes"
# Where to backup to.
dest=$(pwd)

# Send all variables to the log file
echo -e "\n" >> $log
echo -e "\n" >> $log
echo "=====================================================================================>" >> $log
echo "VARIABLES DE ENTORNO IMPRESAS" >> $log
echo $backup_files >> $log
echo $dest >> $log

# Create archive filename.
day=$(date +%A)
username=$(basename "$PWD")
archive_file="$username-$day.tgz"
ruta_archivo=$(pwd)/$archive_file

echo $archive_file >> $log
echo $ruta_archivo >> $log

# Print start status message.
echo "Respaldando $backup_files a $dest/$archive_file"
date
echo

# Backup the files using tar.
tar czvf $dest/$archive_file $backup_files

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest

expect ./transfer.sh $usuario $password $dominio $ruta_archivo