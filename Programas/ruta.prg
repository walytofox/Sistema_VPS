Archivo_ = FILE(".\Path.txt") 
        IF Archivo_ = .T. 
            N_Cadena = ALLTRIM(FILETOSTR(".\CTDB.txt")) 
    * Verifica El Archivo y Genera La Conexion         
            Public xcontrol , MsG_Box , Product_Ident 
            xcontrol = "" 
            MsG_Box  = "Control Cars 2.0 © All Rights Reserved" 
             
            x_Server = ALLTRIM(SUBSTR(N_Cadena,1,(ATC(CHR(13),N_Cadena,1) - 1))) 
            N_Cadena = ALLTRIM(RIGHT(N_Cadena,LEN(N_Cadena) - ( ATC(CHR(13),N_Cadena,1) + 1 ))) 
         endif