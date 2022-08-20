import pandas as pd

#  updload the data
data = pd.read_csv('inegiDelitos.csv', encoding='latin-1')

#  display the data
print("-->Original 'inegiDelitos.csv' CSV data: \n")
#print(data)

#  drop column 
##data.drop('col_3', inplace=True, axis = 1)
drop_list = ["ENTIOCUR", "ELE_COMI", "DELIRIE8", "TOTALCA1"]
data = data.drop(data.columns.difference(drop_list), axis=1)

#  display new csv
print("\n-->CSV Data after deleting the columns:\n")
print(data)

data.to_csv('outputDelitos.csv')
print("\n-->Returned new data as 'outputDelitos.csv'")
