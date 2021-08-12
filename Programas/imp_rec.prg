set cons off
set prin on
??CHR(27)+"C"+CHR(33)
??CHR(27)+CHR(15)
?? chr(27)+chr(80)   && Draf 10 cpi
?? chr(15)           && activa Condensado
?? chr(7)   
set prin off
set devi to prin
set cent off
@0,0  say '#'+repl('=',19)
@0,98 say 'D.S.-001-98-TR-22-01-98  '+repl('=',11)+ind1+'#'
@0,21 say chr(14)+'  RECIBO DE EGRESOS  '
@1,0 say '|'+repl('_',135)+'|'





SET DEVI TO SCRE
SET PRINT ON
?CHR(27)+"C"+CHR(66)
?
SET PRINT OFF
SET CONS ON
EJECT
set cent on
RETUR