#!/bin/bash -i
 
# File: download_pentads.sh
# Project: GODAS
# File Created: Saturday, 7th August 2021 4:36:06 pm
# Author: Gerardo Rivera Tello (grivera@igp.gob.pe)

# To download the whole directory, use the following command

# screen -dmS GODAS wget -r -nH -np --cut-dirs=3 -N -R index.html -e robots=off https://cfs.ncep.noaa.gov/cfs/godas/pentad/

# This will clone the whole data directory into the folder
# the command was launched. The screen command allows the
# download to run even if you log out of your account.
# screen -r GODAS will reattach the shell to the current session
# ctrl+a+d will detach the session.

# You can set this variable to an specific date
# or leave it like this to use the current date
DATE=$(date +%Y/%m/%d)
DATE="2021/08/03"

DATA_DIR="/data/datos/godas/pentadas/test"
DATA_DATE=$(date -d "${DATE} -15 days" +%Y%m%d)
YEAR=$(date -d "${DATE} -15 days" +%Y)

FILENAME="godas.P.${DATA_DATE}.grb"
OUTPUT="${DATA_DIR}/${YEAR}"

BASE_LINK="https://cfs.ncep.noaa.gov/cfs/godas/pentad/${YEAR}/${FILENAME}"

cd $OUTPUT
echo wget --cut-dirs=4 -N $BASE_LINK
echo wget --cut-dirs=4 -N "${BASE_LINK}.inv"

# # Update ctl with new file count
file_count=$(find ${DATA_DIR} -name 'godas.P.*.grb' | wc -l)
echo "$file_count total files"