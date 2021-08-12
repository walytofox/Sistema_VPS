SET DELETED ON
*# RUTA para enviar documentos
ruta = "https://www.nubefact.com/api/v1/d9d49119-b599-4a0c-b3fa-491a50680997"

*# TOKEN para enviar documentos
token = "0adfda4856ca4de9ab1518d53ea73613a696bbc4928d4c1aa0ef2e47129e4875"
*!*	SELECT "operacion|generar_comprobante|" AS CADENA FROM VFACTURA WHERE VOUC ='011401020002' INTO CURSOR CABECERA

*!*	nomarchivo = 'F001-0001.txt'
*!*	nomarchivo2 = 'F001-0001.txt'

*!*	GO top
*!*	COPY TO  c:\REPORTES_SUNAT\&nomarchivo   SDF
*!*	*!*	if !file('C:\REPORTES_SUNAT\LE'+'20506768030'+VANO+VMES+'00080100001111'+'.TXT')
*!*	=fcreate("C:\REPORTES_SUNAT\"+nomarchivo2)

*vvouc = '011707020471'
SELECT ALLTRIM(NSERIE) SERIE, ALLTRIM(NFACTURA) FACTURA,ALLTRIM(TIPO_DOC) TIPO_DOC, ALLTRIM(GLOSA) GLOSA FROM  VFACTURA INTO CURSOR VARI WHERE vouc = vvouc
vser = ALLTRIM(VARI.SERIE)
vfac = ALLTRIM(VARI.FACTURA)
vglo = ALLTRIM(VARI.GLOSA)
vtip = ALLTRIM(VARI.TIPO_DOC)

IF vtip = '01' then
	vtip1='1'
ELSE
	vtip1='3'
ENDIF		

SELECT COUNT(1) as conteo FROM VFACTURA_DETALLE a INNER JOIN ins_venta  b ON a.idpro=b.idpro INNER JOIN insu_afectv c ON b.idpro=c.insumo WHERE vouc = vvouc INTO CURSOR afecto
vafecto = afecto.conteo

SET DELETED ON

SET CENTURY on
SET DATE BRITISH

*** GENERA TRAMA DE FACTURA
***++++++++++++++++++++++++

SELECT 1 as NUM,"operacion|generar_comprobante|" AS CADENA FROM VFACTURA WHERE VOUC =vvouc ;
UNION;
SELECT 2 as NUM,"tipo_de_comprobante|"+vtip1+"|" AS CADENA FROM VFACTURA WHERE VOUC = vvouc ;
UNION;
SELECT 3 as NUM,'serie|'+ALLTRIM(nserie)+'|' AS CADENA FROM VFACTURA WHERE VOUC =vvouc ;
UNION;
SELECT 4 as NUM,'numero|'+ALLTRIM(STR(val(nfactura)))+'|' AS CADENA FROM VFACTURA WHERE VOUC =vvouc ;
UNION;
SELECT 5 as NUM,'sunat_transaction|1|' AS CADENA FROM VFACTURA WHERE VOUC =vvouc ;
UNION;
SELECT 6 as NUM,'cliente_tipo_de_documento|6|' AS CADENA FROM VFACTURA WHERE VOUC =vvouc ;
UNION;
SELECT 7 as NUM,'cliente_numero_de_documento|'+ALLTRIM(B.RUC)+'|' AS CADENA FROM VFACTURA a INNER JOIN CLIENTES B ON A.CODPRO=B.CODPRO WHERE a.VOUC =vvouc ;
UNION;
SELECT 8 as NUM,'cliente_denominacion|'+ALLTRIM(B.COMPLETO)+'|' AS CADENA FROM VFACTURA a INNER JOIN CLIENTES2 B ON A.CODPRO=B.CODPRO WHERE a.VOUC =vvouc ;
UNION;
SELECT 9 as NUM,'cliente_direccion|'+ALLTRIM(B.DIRECCION1)+'-'+ALLTRIM(B.DISTRITO)+'-'+ALLTRIM(B.PROVINCIA)+'|' AS CADENA FROM VFACTURA a INNER JOIN CLIENTES2 B ON A.CODPRO=B.CODPRO WHERE a.VOUC =vvouc ;
UNION;
SELECT 10 as NUM,'cliente_email|'+ALLTRIM(B.MAIL1)+'|' AS CADENA FROM VFACTURA a INNER JOIN CLIENTES2 B ON A.CODPRO=B.CODPRO WHERE a.VOUC =vvouc ;
UNION;
SELECT 11 as NUM,'cliente_email_1|'+ALLTRIM(B.MAIL2)+'|' AS CADENA FROM VFACTURA a INNER JOIN CLIENTES2 B ON A.CODPRO=B.CODPRO WHERE a.VOUC =vvouc ;
UNION;
SELECT 12 as NUM,'cliente_email_2|gibanez@santomartin.pe|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 13 as NUM,'fecha_de_emision|'+ STRTRAN(DTOC(A.FECHA_DOC),'/','-')+'|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 14 as NUM,'fecha_de_vencimiento|'+ STRTRAN(DTOC(A.FECHA_VEN),'/','-')+'|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 15 as NUM,'moneda|'+IIF(A.MONEDA='S','1','2')+'|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 16 as NUM,'tipo_de_cambio|'+IIF(A.MONEDA='S','',ALLTRIM(STR(A.TC,5,3)))+'|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 17 as NUM,'porcentaje_de_igv|18|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 18 as NUM,'descuento_global||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 19 as NUM,'total_descuento||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 20 as NUM,'total_anticipo||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 21 as NUM,'total_gravada|'+ALLTRIM(STR(abs(A.BASE),10,2))+'|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 22 as NUM,'total_inafecta||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 23 as NUM,'total_exonerada||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 24 as NUM,'total_igv|'+ALLTRIM(STR(abs(A.IGV),10,2))+'|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 25 as NUM,'total_gratuita||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 26 as NUM,'total_otros_cargos||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 27 as NUM,'total|'+ALLTRIM(STR(abs(A.TOTAL),10,2))+'|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 28 as NUM,'percepcion_tipo||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 29 as NUM,'percepcion_base_imponible||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 30 as NUM,'total_percepcion||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 31 as NUM,'total_incluido_percepcion||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 32 as NUM,'detraccion|'+IIF(vafecto>=1,'true','false')+'|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 33 as NUM,'observaciones||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 34 as NUM,'documento_que_se_modifica_tipo|'+IIF(vtip1<>'1','1','')+'|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 35 as NUM,'documento_que_se_modifica_serie|'+IIF(vtip1<>'1',ALLTRIM(A.NSERIEM),'')+'|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 36 as NUM,'documento_que_se_modifica_numero|'+IIF(vtip1<>'1',ALLTRIM(A.NFACTURAM),'')+'|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 37 as NUM,'tipo_de_nota_de_credito|'+IIF(vtip1='3','3','')+'|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 38 as NUM,'tipo_de_nota_de_debito||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 39 as NUM,'enviar_automaticamente_a_la_sunat|true|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 40 as NUM,'enviar_automaticamente_al_cliente|true|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 41 as NUM,'codigo_unico|'+ALLTRIM(A.VOUC)+'|' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 42 as NUM,'condiciones_de_pago||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 43 as NUM,'medio_de_pago||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 44 as NUM,'placa_vehiculo||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 45 as NUM,'orden_compra_servicio||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 46 as NUM,'tabla_personalizada_codigo||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 47 as NUM,'formato_de_pdf||' AS CADENA FROM VFACTURA a WHERE a.VOUC =vvouc ;
UNION;
SELECT 48 as NUM,"item|"+ALLTRIM(b.un)+"|"+a.idpro+'|'+ALLTRIM(b.despro)+' '+ALLTRIM(vglo)+IIF(a.unidades>0,' / '+ALLTRIM(STR(a.unidades))+' unidades','')+'|'+ALLTRIM(STR(a.cantidad,9,2))+'|'+ALLTRIM(STR(a.precio_uni,9,2))+'|'+ALLTRIM(STR(a.precio_uni*1.18,9,2))+'||'+ALLTRIM(STR(ABS(a.base),9,2))+'|1|'+ALLTRIM(STR(ABS(a.igv),9,2))+'|'+ALLTRIM(STR(ABS(a.total),9,2))+'|false|||' as CADENA FROM VFACTURA_DETALLE a INNER JOIN ins_venta  b ON a.idpro=b.idpro WHERE VOUC =vvouc ;
INTO CURSOR emp
SELECT CADENA FROM emp ORDER BY NUM INTO CURSOR emp2

*** GENERA ARCHIVO PLANO
***++++++++++++++++++++++
nomarchivo = vser+'-'+vfac+'_'+vvouc+'.txt'
GO top
COPY TO  c:\FACTURA_ELECTRONICA_REPOSITORIO\&nomarchivo   SDF
USE

*** EJECUTA ENVIO DE ARCHIVO PLANO
***+++++++++++++++++++++++++++++++
DO "c:\sistema_vps\programas\nubefact-txt.prg"