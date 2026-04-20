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

model1_diagnostics <- data_ready %>%
  mutate(
    fitted_value = fitted(model1),
    residual = resid(model1),
    model = "Model 1"
  )

model2_diagnostics <- data_ready %>%
  mutate(
    fitted_value = fitted(model2),
    residual = resid(model2),
    model = "Model 2"
  )

residual_plot <- bind_rows(model1_diagnostics, model2_diagnostics) %>%
  ggplot(aes(x = fitted_value, y = residual)) +
  geom_point(alpha = 0.4) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  facet_wrap(~model) +
  labs(
    title = "Residualer i enkel och mer avancerad modell",
    x = "Predikterade kostnader",
    y = "Residual"
  )

residual_plot  

#ggsave("figures/residual_plot.png", residual_plot, width = 8, height = 5)
