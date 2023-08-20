from pathlib import Path
import streamlit as st
import sys
import os
import pandas as pd

filepath = os.path.join(Path(__file__).parents[1])
sys.path.insert(0,filepath)
from tomongo import ToMongo
c= ToMongo()
cursor=c.cards.find()

#listing into a dataframe
df =  pd.DataFrame(list(cursor))
school_list = list(set(df.school.tolist()))
school = st.selectbox("Pick a school to query data from", placeholder= "Both Schools", options=["Both Schools"] + school_list)
df2 = df
if school != "Both Schools":
    df2 = df2[df2['school'] == school]
category_list = df2.columns.tolist()
category_list.remove('school')
# print(category_list)
category = st.selectbox("Pick a category you want you to query based on.", options=category_list)
all_options = list(set(df2[category].tolist()))
choice = st.selectbox("What parameter you want to see students that fit", options= all_options)

st.dataframe(pd.DataFrame(df2[df2[category] == choice]),hide_index=True)