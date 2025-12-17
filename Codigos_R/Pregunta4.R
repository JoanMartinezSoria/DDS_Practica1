logs2 <- logs %>%
  mutate(
    req_parts = str_split(logs$Peticion, " ", simplify = TRUE),
    method = req_parts[,1],
    url = req_parts[,2],
    proto = req_parts[,3]
  )

p4 <- logs2 %>%
  filter(str_detect(IP, "\\.edu")) %>%
  filter(str_detect(url, "\\.txt$")) %>%
  summarise(total_bytes_txt = sum(BytesReply))

print(p4)

#--------------------------------------------------------------------

print(p4$total_bytes_txt)