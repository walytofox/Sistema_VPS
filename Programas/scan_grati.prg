SELECT codigo, SUM(basico+asigna+vacaciones+bonif)/6 as grati, SUM(h125+h135+h2) as he FROM planilla_Acum WHERE ano=2016 AND mes = 1  GROUP BY codigo;
union all;
SELECT codigo, SUM(basico+asigna+vacaciones+bonif)/6 as grati, SUM(h125+h135+h2) as he FROM planilla_Acum WHERE ano=2016 AND mes = 2  GROUP BY codigo;
union all;
SELECT codigo, SUM(basico+asigna+vacaciones+bonif)/6 as grati, SUM(h125+h135+h2) as he FROM planilla_Acum WHERE ano=2016 AND mes = 3  GROUP BY codigo;
union all;
SELECT codigo, SUM(basico+asigna+vacaciones+bonif)/6 as grati, SUM(h125+h135+h2) as he FROM planilla_Acum WHERE ano=2016 AND mes = 4  GROUP BY codigo;
union all;
SELECT codigo, SUM(basico+asigna+vacaciones+bonif)/6 as grati, SUM(h125+h135+h2) as he FROM planilla_Acum WHERE ano=2016 AND mes = 5  GROUP BY codigo;
union all;
SELECT codigo, SUM(basico+asigna+vacaciones+bonif)/6 as grati, SUM(h125+h135+h2) as he FROM planilla_Acum WHERE ano=2016 AND mes = 6  GROUP BY codigo ORDER BY codigo INTO CURSOR bb readwrite

select bb
GO top
ini = bb.grati
contador = 0
sumador1 = 0
codigov = codigo
SCAN 
	contador = contador + 1
	sumador1 = grati+sumador1

IF 	codigo = codigov THEN 
	IF ini = bb.grati  then
		ini = bb.grati
	ELSE 
		grati_tmp = bb.grati
		replace bb.grati with bb.grati+((grati*contador)-sumador1 )
		ini = grati_tmp
		grati_tmp = 0
	ENDIF
ELSE 
 codigov = codigo
 ini = bb.grati
 contador = 1
sumador1 = grati
ENDIF	
ENDSCAN