import os
import dbf
import pandas as pd
import sys  


data = []
for file in sorted(os.listdir('Y:\\Sistema_VPS\\')):
    data.append((file))

df = pd.DataFrame(data, columns=['file'])
new_df = df[df.file.str.contains(".DBF", case=False) == True] 
print (new_df)

for index, row in new_df.iterrows():
    d=dbf.Table('Y:\\Sistema_VPS\\'+row['file'], ignore_memos=True)
    t = row['file']
    d.open()
    try:
        os.remove('Y:\\CARGA_BATCH\\data_migra\\'+(t[0:-4])+'.csv')
    except OSError:
        pass
    
    dbf.export(d, filename='Y:\\CARGA_BATCH\\data_migra\\'+(t[0:-4])+'.csv', format='csv', header=False)
    print('Y:\\CARGA_BATCH\\data_migra\\'+(t[0:-4])+'.csv')