'''
Henry Cheng
10/26/21
Status: Dev
'''

import pandas as pd

path_file = '../output/csv/HP_Member.csv'

df = pd.read_csv(path_file, low_memory=False)

df.to_csv('../output/HP_Member2021019.txt', sep='|', index=False)