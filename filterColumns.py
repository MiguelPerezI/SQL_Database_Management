import pandas as pd

#  updload the data
data = pd.read_csv('inegi.csv', encoding='latin-1')

#  display the data
print("-->Original 'inegi.csv' CSV data: \n")
#print(data)

#  drop column 
##data.drop('col_3', inplace=True, axis = 1)
drop_list = ["ENTIDAD", "NOM_ENT ", "DISTRITO", "INDIGENA", "POBTOT", "POBFEM", "POBMAS", "PCLIM_RE_C", "GRAPROES", "PE_INAC", "PEA", "TVIVPAR"]
data = data.drop(data.columns.difference(drop_list), axis=1)

#  display new csv
print("\n-->CSV Data after deleting the column 'year':\n")
print(data)

data.to_csv('output.csv')
print("\n-->Returned new data as 'output.csv'")
