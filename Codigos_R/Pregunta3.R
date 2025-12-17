#install.packages("lubridate")
library("lubridate")
#Obtenemos todos los logs que realizen una peticion GET
peticiones_get <- logs %>%
  filter(str_detect(Peticion, "^GET"))

#Calculamos la hora con mas peticiones GET
hora_pico <- peticiones_get %>%
  mutate(
    #Como tenemos los datos tratados con anterioridad, podemos obtener el dia y la hora de un timestamp por separadp, ya que podria haber peticiones en la misma hora pero dias distintos
    dia = day(peticiones_get$Timestamp),
    hora = hour(peticiones_get$Timestamp)
  ) %>%
  #Hacemos el conteo de gets por cada dia y hora
  count(dia, hora, sort = TRUE)

#--------------------------------------------------------------------

print(hora_pico[1,])

#--------------------------------------------------------------------

#Juntamos dia y hora en una misma variable
datos_tabla <- xtabs(n ~ dia + hora, data = hora_pico)

barplot(
  datos_tabla, 
  beside = TRUE,
  col = rainbow(nrow(datos_tabla)),
  legend = rownames(datos_tabla), 
  args.legend = list(x = "topright", title = "Día"),
  
  # Etiquetas
  main = "Peticiones GET por Hora y Día",
  xlab = "Hora del día",
  ylab = "Cantidad de Peticiones",
  las = 1
)

#--------------------------------------------------------------------

#install.packages("ggplot2")
library(ggplot2)

#Codigo para crear un 
ggplot(hora_pico, aes(x = factor(hora), y = n, fill = factor(dia))) +
  geom_col(position = "dodge", width = 0.35) +
  
  #Codigo para añadir el valor exacto encima de cada barra
  geom_text(aes(label = n), 
            position = position_dodge(width = 0.7), 
            vjust = -0.5, 
            size = 2.5) +
  
  #Etiquetas y estética
  labs(
    title = "Peticiones GET por Día y Hora",
    x = "Hora",
    y = "Número de Peticiones",
    fill = "Día del Mes"
  )