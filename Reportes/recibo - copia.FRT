   c   @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              �DRIVER=winspool
DEVICE=Enviar a OneNote 2013
OUTPUT=nul:
ORIENTATION=0
PAPERSIZE=9
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=600
COLOR=2
YRESOLUTION=600
                              A  )  winspool  Enviar a OneNote 2013  nul:                                                                                �Enviar a OneNote 2013            � /   	 �
od   X  X  Letter                                                        ����                DINU" �   ¬�Q                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         �   SMTJ     � S e n d   t o   M i c r o s o f t   O n e N o t e   1 5   D r i v e r   RESDLL UniresDLL PaperSize LETTER Orientation PORTRAIT Resolution DPI600 ColorMode 24bpp                                                           ISPE                                                     Courier New                                                   "RECIBO DE"                                                   Courier New                                                   codigo_m                                                      ind1                                                          Courier New                                                   	ingreso_s                                                     vtipo                                                         Courier New                                                   	ingreso_s                                                     0iif(vtipo="INGRESOS","Recibi de:","Entregue a:")              Courier New                                                   	ingreso_s                                                     ltrim(rtrim(vprocli))                                         Courier New                                                   "la suma de:"                                                 Courier New                                                   	ingreso_s                                                     monto1                                                        "999,999.99"                                                  Courier New                                                   	ingreso_s                                                     "("+vmonto+")"                                                Courier New                                                   "Por concepto de:"                                            Courier New                                                   	ingreso_s                                                     vglosa                                                        Courier New                                                   	ingreso_s                                                     vempresa                                                      cursor                                                        Courier New                                                   	ingreso_s                                                     vconcepto+" -- "+vcc                                          Courier New                                                   "Documentos afectos:"                                         Courier New                                                   "Encargado Caja"                                              Courier New                                                   "Recibidor/Pagador"                                           Courier New                                                   	ingreso_s                                                     ;iif(vtipo="INGRESOS","Entregue Conforme","Recibi Conforme")                                                                   Courier New                                                   "Firma"                                                       Courier New                                                   "Documento"                                                   Courier New                                                   	ingreso_s                                                     vfact                                                         Courier New                                                   0iif(mon="S","Nuevos Soles","Dolares Americanos")              Courier New                                                   Courier New                                                   Courier New                                                   Courier New                                                   Courier New                                                   Courier New                                                   dataenvironment                                               cTop = 324
Left = -485
Width = 1350
Height = 589
DataSource = .NULL.
Name = "Dataenvironment"
                           cursor                                                        �Top = 20
Left = 10
Height = 90
Width = 90
Alias = "vta_repo"
Database = ..\caja.dbc
CursorSource = "vta_repo"
Name = "Cursor1"
                                                       �Top = 20
Left = 150
Height = 90
Width = 90
Alias = "vta_ce"
Database = ..\caja.dbc
CursorSource = "vta_ce"
Name = "Cursor2"
                                                    