# undersök datasetets storlek och struktur

head(data)

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

data %>%
  count(sex, sort = TRUE)

data %>%
  count(region, sort = TRUE)

data %>%
  count(smoker, sort = TRUE)

data %>%
  count(chronic_condition, sort = TRUE)

data %>%
  count(exercise_level, sort = TRUE)

data %>%
  count(plan_type, sort = TRUE)

#2) Datastädning och förberedelse

data_ready <- data %>%
  mutate(
    region = str_trim(region),
    region = str_to_lower(region),
    smoker = str_trim(smoker),
    smoker = str_to_lower(smoker),
    plan_type = str_trim(plan_type),
    plan_type = str_to_lower(plan_type),
    sex = as.factor(sex),
    region = as.factor(region),
    smoker = as.factor(smoker),
    chronic_condition = as.factor(chronic_condition),
    exercise_level = as.factor(exercise_level),
    plan_type = as.factor(plan_type)
  )

data_ready %>%
  count(sex, sort = TRUE)

data_ready %>%
  count(region, sort = TRUE)

data_ready %>%
  count(smoker, sort = TRUE)

data_ready %>%
  count(chronic_condition, sort = TRUE)

data_ready %>%
  count(exercise_level, sort = TRUE)

data_ready %>%
  count(plan_type, sort = TRUE)

# Saknade värden:
# kategoriska variabler ersätts med "Unknown"
# numeriska variabler ersätts med medianen

data_ready <- data_ready %>%
  mutate(
    exercise_level = if_else(is.na(exercise_level), "unknown", exercise_level),
    
    bmi = if_else(
      is.na(bmi),
      median(bmi, na.rm = TRUE),
      bmi
    ),
    
    annual_checkups = if_else(
      is.na(annual_checkups),
      median(annual_checkups, na.rm = TRUE),
      annual_checkups
    )
  )

colSums(is.na(data_ready))

# skapa nya variabler

data_ready <- data_ready %>%
  mutate(risk_score = prior_accidents + prior_claims,
         high_risk = if_else(
           risk_score > 1, "yes", "no"),
         high_risk = as.factor(high_risk)
  )

data_ready %>%
  count(high_risk, sort = TRUE)
