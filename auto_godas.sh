#!/bin/bash -l
#Created on Sat Aug 14 18:03:00 2021
#Author: Gerardo Rivera Tello
#Email: grivera@igp.gob.pe

# Set up the environment
source /data/users/service/GODAS/godas_pentads/variables.sh
source ~/miniconda3/etc/profile.d/conda.sh
conda activate pangeo

cd $GODAS_SCRIPTS_DIR || exit

# Run Download script
sh download_pentads.sh

if [ $? -eq 1 ]
then
    echo "Download failed. Maybe there's no new file"
    exit 1
fi

# Get new file count
file_count=$(find ${GODAS_GRB_DIR} -name 'godas.P.*.grb' | wc -l)
echo "$file_count total files"

# sed into base ctl template
sed "s/NTIME/$file_count/" templates/godas_pentad_tgrid_template.ctl >$GODAS_GRB_DIR/godas_pentad_tgrid.ctl
sed "s/NTIME/$file_count/" templates/godas_pentad_ugrid_template.ctl >$GODAS_GRB_DIR/godas_pentad_ugrid.ctl
sed "s/NTIME/$file_count/" templates/godas_pentad_wgrid_template.ctl >$GODAS_GRB_DIR/godas_pentad_wgrid.ctl

# Unload old GrADS
module unload grads/2.0.2 

# Load modern GrADS
module load opengrads/2.2.1.oga.1
export GADDIR=/opt/opengrads/2.2.1.oga.1/data

tgrid="gribmap -i godas_pentad_tgrid.ctl -0"
ugrid="gribmap -i godas_pentad_ugrid.ctl -0"
wgrid="gribmap -i godas_pentad_wgrid.ctl -0"

cd $GODAS_GRB_DIR
screen -dmS tgrid bash -c "$tgrid ; $tgrid -old"
screen -dmS ugrid bash -c "$ugrid ; $ugrid -old"
screen -dmS wgrid bash -c "$wgrid ; $wgrid -old"