#install.packages("stringr")
library("stringr")

#Buscamos los logs que contengan .edu y los almacenamos en una nueva variable
ips_edu <- str_subset(logs$IP,"\\.edu$")
head(ips_edu)

#--------------------------------------------------------------------

total_ips_edu <- length(ips_edu)

print(total_ips_edu)

#--------------------------------------------------------------------

ips_edu_unicas <- unique(ips_edu)
total_ips_edu_unicas <- length(ips_edu_unicas)

print(total_ips_edu_unicas)