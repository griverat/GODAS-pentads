dset ^%y4/godas.P.%y4%m2%d2.grb
index ^godas.pentad.tgrid.grb.idx
undef 9.999E+20
title godas pentad data.  single level fields and subsurface data on temperature grid.
*  produced by grib2ctl v0.9.12.5p39a
dtype grib 255
options template 365_day_calendar
ydef 418 linear -74.500000 0.333
xdef 360 linear 0.500000 1.000000
TDEF NTIME linear 00Z05jan1980 5dy
*  z has 40 levels, for dsl.  these are levels for fields on the temperature grid (modified manually)
ZDEF 40 levels 5, 15, 25, 35, 45, 55, 65, 75, 85, 95, 
    105, 115, 125, 135, 145, 155,
    165, 175, 185, 195, 205, 215, 225, 238, 262, 303,
    366, 459, 584, 747, 949, 1193, 1479,
    1807, 2174, 2579, 3016, 3483, 3972, 4478
vars 7
DBSSbmxl  0 195,237,0 ** bottom ocn mixed layer Geometric Depth Below Sea Surface [m]
DBSSbitl  0 195,238,0 ** bottom ocn isothermal layer Geometric Depth Below Sea Surface [m]
POTdsl 40 13,160,0 ** (profile) Potential temp. [K]
SALTYdsl 40 88,160,0 ** (profile) Salinity [kg/kg]
SLTFLsfc  0 199,1,0  ** surface Salt flux [g/cm^2/s]
SSHGsfc  0 198,1,0  ** surface Sea Surface Height Relative to Geoid [m]
THFLXsfc  0 202,1,0  ** surface Total downward heat flux at surface [W/m^2]
ENDVARS
