# Regressionsanalys

model1 <- lm(charges ~ age + bmi + smoker, data = data_ready)

model2 <- lm(
  charges ~ age + bmi + children + smoker + sex + region +
    exercise_level + chronic_condition + plan_type +
    risk_score,
  data = data_ready
)

summary(model1)

summary(model2)