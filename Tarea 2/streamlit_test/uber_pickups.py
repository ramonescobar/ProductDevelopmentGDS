import streamlit as st
import pandas as pd
import numpy as np
import math

st.write("Uber pickups test")

DATA_SOURCE = "https://s3-us-west-2.amazonaws.com/streamlit-demo-data/uber-raw-data-sep14.csv.gz"

@st.cache
def download_data():
    return (pd.read_csv(DATA_SOURCE)).rename(columns={"Lat": "lat", "Lon": "lon"})

df = download_data()

hora = pd.to_datetime(df['Date/Time']).dt.hour
st.bar_chart(hora.value_counts())


page_size = 1000
total_pages = math.ceil(len(df)/page_size)
starting_value = 0


slider = st.slider('select the page', 1, total_pages)

st.write("Page selected",
         slider,
         "with limits",
         ((slider-1)*page_size,(slider*page_size)-1))

df = df.loc[(slider-1)*page_size:(slider*page_size)]

minh = float(min(hora.unique()))
maxh = float(max(hora.unique()))

hora_slider = st.slider('Seleccione rango de horas',
                                minh,
                                maxh,
                                (minh+1.0, maxh-1.0))



df2 =  df
df2['hora'] = pd.to_datetime(df2['Date/Time']).dt.hour
df2 = df2[df2['hora'].between(hora_slider[0], hora_slider[1])]

df2

st.map(df2)