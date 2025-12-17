rows <- nrow(logs)
columns <- ncol(logs)

print(rows)
print(columns)

#--------------------------------------------------------------------

media <- mean(logs$BytesReply)

print(media)