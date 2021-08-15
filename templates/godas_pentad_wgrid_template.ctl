dset ^%y4/godas.P.%y4%m2%d2.grb
index ^godas.pentad.wgrid.grb.idx
undef 9.999E+20
title godas pentad single level data and subsurface data available on vertical velocity grid
*  produced by grib2ctl v0.9.12.5p39a
dtype grib 255
options template 365_day_calendar
ydef 418 linear -74.500000 0.333
xdef 360 linear 0.500000 1.000000
TDEF NTIME linear 00Z05jan1980 5dy
*  z has 40 levels, for dsl. these are levels for the vertical velocity grid 
zdef 40 levels
10 20 30 40 50 60 70 80 90 100
110 120 130 140 150 160 170 180 190 200
210 220 231 250 282 334 412 521 665 848
1071 1336 1643 1990 2376 2797 3249 3727 4225 4736
vars 1
DZDTdsl 40 40,160,0 ** (profile) Geometric vertical velocity [m/s]
ENDVARS
