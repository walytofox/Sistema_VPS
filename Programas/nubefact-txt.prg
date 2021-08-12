* #########################################################
* #### INTEGRACIÓN FÁCIL ####
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++
* # ESTE CÓDIGO FUNCIONA PARA LA VERSIÓN ONLINE Y OFFLINE
* # Visita www.nubefact.com/integracion para más información
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++

* #########################################################
* #### FORMA DE TRABAJO ####
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++
* # PASO 1: Conseguir una RUTA y un TOKEN para trabajar con NUBEFACT (Regístrate o ingresa a tu cuenta en www.nubefact.com).
* # PASO 2: Generar un archivo en formato .JSON o .TXT con una estructura que se detalla en este documento.
* # PASO 3: Enviar el archivo generado a nuestra WEB SERVICE ONLINE u OFFLINE según corresponda usando la RUTA y el TOKEN.
* # PASO 4: Generamos el archivo XML y PDF (Según especificaciones de la SUNAT) y te devolveremos INSTANTÁNEAMENTE los datos del documento generado.
* # Para ver el documento generado ingresa a www.nubefact.com/login con tus datos de acceso, y luego a la opción "Ver Facturas, Boletas y Notas"
* # IMPORTANTE: Enviaremos el XML generado a la SUNAT y lo almacenaremos junto con el PDF, XML y CDR en la NUBE para que tu cliente pueda consultarlo en cualquier momento, si así lo desea.
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++

*DO c:\sistema_vps\programas\genera_fact_elect.prg

* #########################################################
* #### PASO 1: CONSEGUIR LA RUTA Y TOKEN ####
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++
* # CUENTA DEMO PARA HACER PRUEBAS
* # Puedes usar la siguiente cuenta para hacer pruebas:
* #  - LINK: https://demo.nubefact.com/login
* #  - USUARIO: demo@nubefact.com
* #  - PASSWORD: demo@nubefact.com
* # Una vez que ingreses a esta cuenta ve a la opción API (Integración) para ver la RUTA y el TOKEN los cuales son:
* #  - RUTA: https://demo.nubefact.com/api/v1/03989d1a-6c8c-4b71-b1cd-7d37001deaa0
* #  - TOKEN: d0a80b88cde446d092025465bdb4673e103a0d881ca6479ebbab10664dbc5677
* # También puedes crear una cuenta propia para hacer pruebas más precisas.
* #
* # CREAR UNA CUENTA PROPIA
* #  - Regístrate gratis en www.nubefact.com/register
* #  - Ir la opción API (Integración).
* # IMPORTANTE: Para que la opción API (Integración) de tu cuenta propia esté activada necesitas escribirnos a soporte@nubefact.com o llámanos al teléfono: 01 468 3535 (opción 2) o celular (WhatsApp) 955 598762.
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++

*# RUTA para enviar documentos
ruta = "https://www.nubefact.com/api/v1/d9d49119-b599-4a0c-b3fa-491a50680997"

*# TOKEN para enviar documentos
token = "0adfda4856ca4de9ab1518d53ea73613a696bbc4928d4c1aa0ef2e47129e4875"


*#########################################################
*#### PASO 2: GENERAR EL ARCHIVO PARA ENVIAR A NUBEFACT ####
*+++++++++++++++++++++++++++++++++++++++++++++++++++++++
*# - MANUAL para archivo JSON en el link: https://goo.gl/WHMmSb
*# - MANUAL para archivo TXT en el link: https://goo.gl/Lz7hAq
*+++++++++++++++++++++++++++++++++++++++++++++++++++++++

* CONSTRUIMOS EL TXT

TipoComprobante = 1
Serie = 'F001'
Nummero = 1
Fecha = "09-05-2017"

*# CAPTURAR VARIABLES DESDE UN FORMULARIO PODRÍA USAR LO SIGUIENTE:
* TipoComprobante=thisform.cbodocumento.DisplayValue
* Serie=thisform.cboserie.DisplayValue
* Nummero=thisform.txtnum.Value
* Fecha=thisform.cbodia.DisplayValue+"-"+thisform.cbomes.DisplayValue+"-"+thisform.cboan.DisplayValue
* thisform.Rpta.Caption =  Cliente+" "+TipoComprobante+" "+Serie+" "+Num+" "+Fecha

* CUIDADO! "TEXT TO" no funciona en versiones anteriores a VF8
cText = FILETOSTR("C:\FACTURA_ELECTRONICA_REPOSITORIO\"+nomarchivo)

TEXT TO txt_para_envio NOSHOW TEXT PRETEXT 7
<<ALLTRIM(cText)>>
ENDTEXT

* #########################################################
* #### PASO 3: ENVIAR EL ARCHIVO A NUBEFACT ####
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++
* # SI ESTÁS TRABAJANDO CON ARCHIVO JSON
* # - Debes enviar en el HEADER de tu solicitud la siguiente lo siguiente:
* # Authorization = Token token="8d19d8c7c1f6402687720eab85cd57a54f5a7a3fa163476bbcf381ee2b5e0c69"
* # Content-Type = application/json
* # - Adjuntar en el CUERPO o BODY el archivo JSON o TXT
* # SI ESTÁS TRABAJANDO CON ARCHIVO TXT
* # - Debes enviar en el HEADER de tu solicitud la siguiente lo siguiente:
* # Authorization = Token token="8d19d8c7c1f6402687720eab85cd57a54f5a7a3fa163476bbcf381ee2b5e0c69"
* # Content-Type = text/plain
* # - Adjuntar en el CUERPO o BODY el archivo JSON o TXT
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++

post_connect = CreateObject("MSXML2.ServerXMLHTTP")
* Para algunas versiones de XMLHTTP, usar:
*     post_connect = CreateObject("Microsoft.XMLHTTP")
*     post_connect = CreateObject("MSXML2.XMLHTTP")
post_connect.Open("POST", ruta, .F.)
post_connect.setRequestHeader("Content-Type", "text/plain")
post_connect.setRequestHeader("Authorization", "Token token=" + token)
post_connect.Send(txt_para_envio)
txt_respuesta = post_connect.responsetext

* #########################################################
* #### PASO 4: LEER RESPUESTA DE NUBEFACT ####
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++
* # Recibirás una respuesta de NUBEFACT inmediatamente lo cual se debe leer, verificando que no haya errores.
* # Debes guardar en la base de datos la respuesta que te devolveremos.
* # Escríbenos a soporte@nubefact.com o llámanos al teléfono: 01 468 3535 (opción 2) o celular (WhatsApp) 955 598762
* # Puedes imprimir el PDF que nosotros generamos como también generar tu propia representación impresa previa coordinación con nosotros.
* # La impresión del documento seguirá haciéndose desde tu sistema. Enviaremos el documento por email a tu cliente si así lo indicas en el archivo JSON o TXT.
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++

* LEEMOS LA RESPUESTA contenido en txt_respuesta, cada FILA de la respuesta debe ser leido.

MESSAGEBOX(txt_respuesta)
