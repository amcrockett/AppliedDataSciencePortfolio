
'''
Yelp Review Json:

Program parses Json. Converts Json file to dataframe. Then cleans the DataFrame
to remove key value pairs from dataframe
'''

### Necessary Packages
import json
import pandas as pd
import numpy as np
import re
from itertools import islice

#import Business data

yb_file = 'yelp_academic_dataset_business.json'

yelp_business = []
for line in open(yb_file, encoding="utf8"):
    yelp_business.append(json.loads(line))

yelp_business = pd.DataFrame.from_records(yelp_business)

yelp_business.drop(['address', 'attributes', 'hours', 'is_open', 'latitude', 'longitude', 'neighborhood'], axis=1, inplace=True)
yelp_business_cleaned = yelp_business[yelp_business['categories'].str.contains('Restaurants') == True]
yelp_business_cleaned = yelp_business_cleaned[yelp_business_cleaned['postal_code'].str.contains('^(\d{5})$') == True]
#transform categories out of multi value

businesses_final_distinct = list(yelp_business_cleaned['business_id'].unique())

yr_file = 'review_150k.json'
#creates list of key value pairs
yelp_reviews = []
for line in open(yr_file, encoding="utf8"):
    line = json.loads(line)
    is_restaurant = line['business_id'] in list(businesses_final_distinct)
    if not is_restaurant:
        continue
    yelp_reviews.append(line)

# View type of yelp_reviews
print(type(yelp_reviews))
print(len(yelp_reviews))
print(type(yelp_reviews[0]))

yelp_reviews_df = pd.DataFrame.from_records(yelp_reviews)

def strip_dict_values(x):
    if isinstance(x,dict):
        v = list(x.values())
        return v[0]
    else:
        return x

cols_with_dict = list(yelp_reviews_df)

for col in cols_with_dict:
 yelp_reviews_df[col] = yelp_reviews_df[col].apply(strip_dict_values)



#file = 'review_150k.json'

# #creates list of key value pairs
# yelp_reviews = []
# for line in open(file, encoding="utf8"):
#     yelp_reviews.append(json.loads(line))
#
# # View type of yelp_reviews
# print(type(yelp_reviews))
#
# #view type of on yelp review
# print(type(yelp_reviews[0]))
#
# #convert Yelp reviews into a data frame
# #
# yelp_reviews_df = pd.DataFrame.from_records(yelp_reviews)
#
# def strip_dict_values(x):
#     if isinstance(x,dict):
#         v = list(x.values())
#         return v[0]
#     else:
#         return x
#
# cols_with_dict = list(yelp_reviews_df)
#
# for col in cols_with_dict:
#  yelp_reviews_df[col] = yelp_reviews_df[col].apply(strip_dict_values)
#
# #yelp_reviews_df_strip =  yelp_reviews_df.strip('{\'$numberInt\':\'}')
# #cool = [d.get('cool') for d in yelp_reviews_df.cool]
#
# #print(yelp_reviews_df.head)
#
# print(list(yelp_reviews_df))
