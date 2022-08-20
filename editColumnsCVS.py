import pandas as pd

#  updload the data
data = pd.read_csv('input.csv')

#  display the data
print("-->Original 'input.csv' CSV data: \n")
print(data)

#  drop column 
data.drop('col_3', inplace=True, axis = 1)

#  display new csv
print("\n-->CSV Data after deleting the column 'year':\n")
print(data)

data.to_csv('output.csv')
print("\n-->Returned new data as 'output.csv'")
