#Solo ejecutar la primera linea la primera vez, luego hay que comentarla a no ser que se limpien los datos
#logs$Peticion <- str_split(logs$Peticion, " ", simplify = TRUE)
sum(logs$Peticion[,2] == "/")