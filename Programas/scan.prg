**SELECT MIN(nfactura ) FROM vfactura WHERE tipo_doc = '01' AND mes ='01' AND ano = '2014' ORDER BY nfactura INTO CURSOR aaa
CLOSE TABLES
USE vfactura
SET FILTER TO ano = '2014' AND tipo_doc = '01'
INDEX on nfactura TAG dx1
CALCULATE MIN(nfactura) TO nfact2
nfact = val(nfact2)
SCAN 
IF VAL(nfactura) = nfact OR VAL(nfactura) = nfact+1 then
nfact = VAL(nfactura)
REPLACE vouc2 WITH '0'
ELSE
cad = VAL(nfactura)- nfact - 1
REPLACE vouc2 WITH ALLTRIM(STR(cad))
nfact = VAL(nfactura)
endif
ENDSCAN
