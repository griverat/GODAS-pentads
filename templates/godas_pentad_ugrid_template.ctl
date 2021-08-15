dset ^%y4/godas.P.%y4%m2%d2.grb
index ^godas.pentad.ugrid.grb.idx
undef 9.999E+20
title godas pentad data.  single level fields and subsurface data on horizontal velocity grid.
*  produced by grib2ctl v0.9.12.5p39a
dtype grib 255
options template 365_day_calendar
ydef 418 linear -74.00000 0.333
xdef 360 linear 1.000000 1.000000
TDEF NTIME linear 00Z05jan1980 5dy
*  z has 40 levels, for dsl.  these are levels for fields on the horizontal velocity grid (modified manually)
ZDEF 40 levels 5, 15, 25, 35, 45, 55, 65, 75, 85, 95, 
    105, 115, 125, 135, 145, 155,
    165, 175, 185, 195, 205, 215, 225, 238, 262, 303,
    366, 459, 584, 747, 949, 1193, 1479,
    1807, 2174, 2579, 3016, 3483, 3972, 4478
vars 4
UFLXsfc  0 124,1,0  ** surface Zonal momentum flux [N/m^2]
UOGRDdsl 40 49,160,0 ** (profile) u of current [m/s]
VFLXsfc  0 125,1,0  ** surface Meridional momentum flux [N/m^2]
VOGRDdsl 40 50,160,0 ** (profile) v of current [m/s]
ENDVARS
