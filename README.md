# Base de datos para el modelo Mixed-Frequency Bayesian VAR (MF-BVAR)

## Descripción

Esta base de datos reúne variables macroeconómicas de frecuencia mensual y trimestral para la estimación de un modelo Mixed-Frequency Bayesian Vector Autoregression (MF-BVAR) orientado al análisis y nowcasting del Producto Interno Bruto (PIB) de Colombia.

La frecuencia de referencia de la base es mensual. El PIB, al ser una variable trimestral, se incorpora únicamente en el primer mes de cada trimestre (enero, abril, julio y octubre), dejando valores faltantes (NA) en los meses intermedios.

---

## Variables

### `date`
Fecha correspondiente a cada observación mensual.

- Frecuencia: Mensual.

---

### `Precio_Petroleo`
Precio promedio mensual del petróleo Brent.

- Fuente: Federal Reserve Economic Data (FRED).
- Serie: **POILBREUSDM**.
- Unidad: USD por barril.
- Frecuencia: Mensual.

---

### `ISE`
Indicador de Seguimiento a la Economía.

- Fuente: DANE.
- Serie utilizada: **Datos ajustados por efecto estacional y calendario**.
- Frecuencia: Mensual.
- Unidad: Índice.

---

### `Tasa de política monetaria`
Tasa de política monetaria fijada por el Banco de la República.

- Fuente: Banco de la República.
- Serie utilizada: **Dato mes**.
- Frecuencia: Mensual.
- Unidad: Porcentaje (%).

---

### `Inflación total`
Inflación total al consumidor.

- Fuente: Banco de la República.
- Serie utilizada: **Dato fin de mes**.
- Frecuencia: Mensual.
- Unidad: Porcentaje (%).

---

### `Tasa Representativa del Mercado (TRM)`
Tipo de cambio nominal COP/USD.

- Fuente: Banco de la República.
- Serie utilizada: **Promedio mensual**.
- Frecuencia: Mensual.
- Unidad: Pesos colombianos por dólar estadounidense (COP/USD).

---

### `IPI`
Índice de Producción Industrial.

- Fuente: DANE.
- Serie utilizada: **Datos ajustados por efecto estacional y calendario**.
- Frecuencia: Mensual.
- Unidad: Índice.

---

### `df_PIB`
Producto Interno Bruto (PIB) real.

- Fuente: DANE.
- Serie utilizada: **PIB real ajustado por efecto estacional y calendario**.
- Frecuencia: Trimestral.
- Unidad: Miles de millones de pesos encadenados (según la metodología vigente del DANE).

El PIB se registra únicamente en el primer mes de cada trimestre (enero, abril, julio y octubre). En los meses restantes se asigna un valor faltante (`NA`), de acuerdo con la estructura requerida para la estimación del modelo MF-BVAR.

---

## Periodo de estudio

Enero de 2014 – Diciembre de 2025.

---

## Observaciones

Las series utilizadas corresponden a versiones oficiales publicadas por el DANE, el Banco de la República y FRED. Cuando la entidad productora ofrece series ajustadas por efecto estacional y calendario, se utilizaron dichas versiones con el fin de eliminar patrones estacionales y facilitar el análisis de la dinámica económica subyacente.
