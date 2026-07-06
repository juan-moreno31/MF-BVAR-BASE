###################################
# En este script voy a unir y procesar todas las bases de datos
###################################

# Librerias

if (!require("fredr")) install.packages("fredr")
if (!require("dplyr")) install.packages("dplyr")
if (!require("readr")) install.packages("readr")
if (!require("readxl")) install.packages("readxl")
if (!require("lubridate")) install.packages("lubridate")
if (!require("stringr")) install.packages("stringr")

library(dplyr)
library(readr)
library(readxl)
library(fredr)
library(lubridate)
library(stringr)

# 1) datos del petroleo BRENT

#  Configuración de la API de FRED
fredr_set_key("5d121558ce891d0b386e789bb617544a")  # es la mia profe

# Solicitar datos de FRED

fredr_series_observations(series_id = "POILBREUSDM", 
                         observation_start = as.Date("1992-01-01"), 
                         observation_end = as.Date("2026-05-01")) %>%
  select(date, value) %>%
  rename(Precio_Petroleo = value) -> precio_petroleo

# 2) datos del ISE

ISE <-  read_excel("BASES\\anex-ISE-9actividades-dic2025.xlsx",
 sheet = "Cuadro 2", range = "A26:IS26", col_names = FALSE)

ISE_final <- data.frame(
  date = seq(
    as.Date("2005-01-01"),
    by = "month",
    length.out = ncol(ISE) - 1
  ),
  ISE = as.numeric(gsub(",", ".", unlist(ISE[1, -1])))
)

# 3) Datos de tasa de intervención del Banco de la República

df_TI <-  read_excel("BASES\\graficador_series(TI).xlsx")

# eliminamos el primer renglón que es el tipo de dato

df_TI <- df_TI %>% slice(-1)

# Cambiar todas las fechas al primer día de su mes correspondiente
df_TI <- df_TI %>%
  mutate(Fecha = floor_date(dmy(Fecha), "month"))
# eliminamos los NA
df_TI <- df_TI %>% filter(!is.na(Fecha))

# 4) Datos de inflación

df_inflacion <- read_excel("BASES\\graficador_series(IF).xlsx")

# eliminamos el primer renglón que es el tipo de dato

df_inflacion <- df_inflacion %>% slice(-1)

# eliminamos el ultimo dato ya que es la fecha de descarga

df_inflacion <- df_inflacion %>% slice(-n())

# eliminar los NA

df_inflacion <- df_inflacion %>% filter(!is.na(Fecha))

# 4) TRM

df_TRM <- read_excel("BASES\\graficador_series(TRM).xlsx")

# eliminamos el primer renglón que es el tipo de dato

df_TRM <- df_TRM %>% slice(-1)

# el ultimo dato es la fecha de descarga, lo eliminamos

df_TRM <- df_TRM %>% slice(-n())

# eliminamos los NA

df_TRM <- df_TRM %>% filter(!is.na(Fecha))


