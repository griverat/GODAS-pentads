#!/bin/bash -l
#Created on Sat Aug 07 16:36:06 2021
#Author: Gerardo Rivera Tello
#Email: grivera@igp.gob.pe

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
# DATE="2021/08/28"

for delta in {14..20}
do
    DATA_DATE=$(date -d "${DATE} -${delta} days" +%Y%m%d)
    echo -e "\n\n###### Trying date ${DATA_DATE} ######\n"
    YEAR=$(date -d "${DATE} -15 days" +%Y)

    FILENAME="godas.P.${DATA_DATE}.grb"
    OUTPUT="${GODAS_GRB_DIR}/${YEAR}"

    cd $OUTPUT || echo "Couldn't find output folder, making one" && mkdir -p "$OUTPUT"

    BASE_LINK="https://cfs.ncep.noaa.gov/cfs/godas/pentad/${YEAR}/${FILENAME}"

    cd $OUTPUT
    wget --cut-dirs=4 -N $BASE_LINK || continue ||exit 1
    wget --cut-dirs=4 -N "${BASE_LINK}.inv"
done