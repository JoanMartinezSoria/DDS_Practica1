sum(logs$Peticion[,3] != "HTTP/0.2")

#--------------------------------------------------------------------

http02 <- logs %>% filter(str_detect(logs$Peticion[,3], "HTTP/0.2"))
head(http02)