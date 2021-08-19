function main(args)
'reinit'
say "write_nc_ALL.gs " args
* Get arguments
if (args='?' | args='')
    say 'write_nc_ALL.gs requires 2 argument: GRB_DIR NC_DIR'
    return
else
    GRB_DIR=subwrd(args,1)
    NC_DIR=subwrd(args,2)
endif

'set display color white'
'c'
'set grads off'

'!cd tmp || mkdir tmp'

'open 'GRB_DIR'/godas_pentad_tgrid.ctl'

i=1

'set x 1 360'
'set y 1 418'

while ( i != 3037 )
'set t 'i
'q time'
tiempo=subwrd(result,3)
tiempo=substr(tiempo,4,9)
year=substr(tiempo,6,4)

'!date -d 'tiempo' +%Y%m%d > sysdate.'i
d = read('sysdate.'i)
'!rm sysdate.'i
tiempo = sublin(d,2)
filename = 'godas.P.'tiempo'.nc'
say filename

'set z 1'

'define dbssbmxl = dbssbmxl'
'define dbssbitl = dbssbitl'
'define sltflsfc = sltflsfc'
'define sshgsfc = sshgsfc'
'define thflxsfc = thflxsfc'

'set sdfwrite -flt -rt -3dt tmp/dbssbmxl.nc'
'sdfwrite dbssbmxl'

'set sdfwrite -flt -rt -3dt tmp/dbssbitl.nc'
'sdfwrite dbssbitl'

'set sdfwrite -flt -rt -3dt tmp/sltflsfc.nc'
'sdfwrite sltflsfc'

'set sdfwrite -flt -rt -3dt tmp/sshgsfc.nc'
'sdfwrite sshgsfc'

'set sdfwrite -flt -rt -3dt tmp/thflxsfc.nc'
'sdfwrite thflxsfc'


'set z 1 40'

'define potdsl = potdsl'
'define saltydsl = saltydsl'

'set sdfwrite -flt -rt -4d tmp/potdsl.nc'
'sdfwrite potdsl'

'set sdfwrite -flt -rt -4d tmp/saltydsl.nc'
'sdfwrite saltydsl'

'!cdo merge tmp/*.nc tmp/'filename

path=NC_DIR'/'year'/'

'!cd 'path' || mkdir -p 'path
'!mv tmp/'filename' 'path

i=i+1
endwhile

'quit'

