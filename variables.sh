#!/bin/bash -l
#Created on Sat Aug 14 18:11:24 2021
#Author: Gerardo Rivera Tello
#Email: grivera@igp.gob.pe

# Set up the variables to use in all the bash scripts

# Path to the main folder
export GODAS_SCRIPTS_DIR="/data/users/service/GODAS/godas_pentads"

# Data folder
GODAS_DATA_DIR="/data/datos/godas"

# Path of the downloaded grib files
export GODAS_GRB_DIR="$GODAS_DATA_DIR/pentadas"

# Paths where outputs should be saved
export GODAS_NC_DIR="$GODAS_DATA_DIR/pentadas_nc"
