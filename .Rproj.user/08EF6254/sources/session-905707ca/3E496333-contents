# Individuell inlämningsuppgift – R-programmering för dataanalys

# Case: Försäkringskostnader – analysera vilka faktorer som hänger ihop med kostnader

# 1) Dataförståelse

library(tidyverse)

data <- read_csv("insurance_costs.csv") # Läs in datasetet

head(data)

# undersök datasetets storlek och struktur

glimpse(data)

dim(data) # antal radar och kolumner

summary(data)

# variabeltyper
tibble(
  column = names(data),
  type = sapply(data, class)
)

# saknade värden
colSums(is.na(data))
