#install.packages("readr")
library("readr")

logs <- read_log("epa-http.csv")

#--------------------------------------------------------------------

errores <- problems(logs)$row

#--------------------------------------------------------------------

filas_con_errores <- logs[errores, ]
print(filas_con_errores)

#--------------------------------------------------------------------

#install.packages("dplyr")
#install.packages("tidyr")
library("dplyr")
library("tidyr")

logs <- logs %>% mutate(X5 = replace_na(X5, 0))

#--------------------------------------------------------------------

logs$X2 <- strptime(logs$X2, format = "%d:%H:%M:%S")

#--------------------------------------------------------------------

colnames(logs) <- c("IP", "Timestamp", "Peticion", "CodigoRespuesta", "BytesReply")


