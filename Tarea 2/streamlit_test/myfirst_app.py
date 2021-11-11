import streamlit as st
import pandas as pd
import numpy as np

st.title("This is my first app 4 GM")
x = 4

st.write(x,"square is", x*x)

x,"square is", x*x

df  = pd.DataFrame({
    'first column': [1, 2, 3, 4],
    'second column': [10, 20, 30, 40]
})

st.write(df)

"""
# Titulo 1
## Titulo 2
### sub sub titulo
"""

df

"""
## Lets use some graphs
"""

chart_df = pd.DataFrame(
    np.random.randn(20,3),
    columns=['a','b','c'])

st.line_chart(chart_df)

"""
How about a map
"""

map_df = pd.DataFrame(
    np.random.randn(1000,2) / [50,50] + [37.76,-122.4],
    columns=['lat','lon'])

st.map(map_df)

"""
## show me some widgets
"""

"""
###A checkbox
"""

if st.checkbox("show me a dataframe"):
    map_df

"""
### A slider test
"""

x =st.slider("Select value for X")
st.write(x,"square is", x*x)

"""
###Options
"""
option = st.selectbox("Which number do you like best?", [1,2,3,4,5,6,7,8,9])

'you selected the option', option

"""
### Progressbar
"""

import time


progress_bar_label = st.empty()
progress_bar = st.progress(0)
progress_bar2 = st.sidebar.progress(0)

for i in range(101):
    progress_bar_label.text(f'iteration {i}')
    progress_bar.progress(i)
    time.sleep(0.01)

for i in range(101):
    progress_bar2.progress(i)
    time.sleep(0.01)

option_side = st.sidebar.selectbox('choose your weapon', ['handgun', 'machine gun', 'knife'])
st.sidebar.write('your waepon of choice is:', option_side)

another_slider = st.sidebar.slider('select the range', 0.0, 100.0, (25.0, 75.0))
st.sidebar.write('the range selected is', another_slider)

