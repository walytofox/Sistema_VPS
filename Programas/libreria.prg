FUNCTION literal 
PARAMETERS cantidad,tipo 
* cantidad : La cantidad a ser convertida m ximo 12 caracteres 
private cantid,j,c,cad,long,l,trc,dg1,dg,c,m 
cantid=str(cantidad,12,2) 
j=7 
c=1 
cad="" 
long=9 
l=1 
do case 
   case cantidad=1000000 
        cad='un millon ' 
   case cantidad=1000 
        cad='mil ' 
   case cantidad=0 
        cad='cero ' 
otherwise 
        do while l<>0 
           trc=substr(cantid,j,3) 
           dg1=val(substr(trc,2,1)) 
           dg=val(right(trc,2)) 
           dgm=val(right(trc,3)) 
           if dg<>0 
              if dg1=1 
                 do case 
                    case dg=10 
                         cad='diez '+cad 
                    case dg=11 
                         cad='once '+cad 
                    case dg=12 
                         cad='doce '+cad 
                    case dg=13 
                         cad='trece '+cad 
                    case dg=14 
                         cad='catorce '+cad 
                    case dg=15 
                         cad='quince '+cad 
                    case dg=16 
                         cad='dieciseis '+cad 
                    case dg=17 
                         cad='diecisiete '+cad 
                    case dg=18 
                         cad='dieciocho '+cad 
                    case dg=19 
                         cad='diecinueve '+cad 
                 endcase 
              else 
                 dg=val(right(trc,1)) 
                 if dg<>0 
                    do case 
                       case dg=1 
                            cad='un '+cad 
                       case dg=2 
                            cad='dos '+cad 
                       case dg=3 
                            cad='tres '+cad 
                       case dg=4 
                            cad='cuatro '+cad 
                       case dg=5 
                            cad='cinco '+cad 
                       case dg=6 
                            cad='seis '+cad 
                       case dg=7 
                            cad='siete '+cad 
                       case dg=8 
                            cad='ocho '+cad 
                       case dg=9 
                            cad='nueve '+cad 
                    endcase 
                    if dg1<>0.and.dg1<>2 
                       cad='y '+cad 
                    endif 
                 endif 
              endif 
              do case 
                 case dg1=2 
                      if dg=0 
                         cad='veinte '+cad 
                      else 
                         cad='veinti'+cad 
                      endif 
                 case dg1=3 
                      cad='treinta '+cad 
                 case dg1=4 
                      cad='cuarenta '+cad 
                 case dg1=5 
                      cad='cincuenta '+cad 
                 case dg1=6 
                      cad='sesenta '+cad 
                 case dg1=7 
                      cad='setenta '+cad 
                 case dg1=8 
                      cad='ochenta '+cad 
                 case dg1=9 
                      cad='noventa '+cad 
              endcase 
           endif 
           dg1=val(left(trc,1)) 
           do case 
              case dg1=1 
                   if dgm=100 
                      cad='cien '+cad 
                   else 
                      cad='ciento '+cad 
                   endif 
              case dg1=2 
                   cad='docientos '+cad 
              case dg1=3 
                   cad='trecientos '+cad 
              case dg1=4 
                   cad='cuatrocientos '+cad 
              case dg1=5 
                   cad='quinientos '+cad 
              case dg1=6 
                   cad='seiscientos '+cad 
              case dg1=7 
                   cad='setecientos '+cad 
              case dg1=8 
                   cad='ochocientos '+cad 
              case dg1=9 
                   cad='novecientos '+cad 
           endcase 
           c=c+1 
           long=long-3 
           if val(substr(cantid,1,long))=0 
              l=0 
           else 
              do case 
                 case c=2 
                      j=4 
                      cad='mil '+cad 
                 case c=3 
                      j=1 
                      if val(right(cantid,6))=0 
                         cad='millones ' 
                      else 
                         cad='millones '+cad 
                      endif 
                 case c=4 
                      l=0 
              endcase 
           endif 
        enddo 
endcase 
if substr(cantid,9,1)='1'.and.substr(cantid,8,2)<>'11' 
   cad=substr(cad,1,len(cad)-1)+'o ' 
endif 
m=left(cad,1) 
if tipo=0 
   cad=upper(m)+substr(cad,2,len(cad))+right(cantid,3)+"/100" 
else 
   cad=upper(m)+substr(cad,2,len(cad))  
endif      
return cad 