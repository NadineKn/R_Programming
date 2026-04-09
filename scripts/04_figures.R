#Fördelning av försäkringskostnader

p_charges <- ggplot(data_ready, aes(x = charges)) +
  geom_histogram(bins = 30) +
  labs(
    title = "Fördelning av försäkringskostnader",
    x = "Kostnader",
    y = "Antal"
  )

print(p_charges)

#Ålder vs kostnad och kronisk sjukdom

p_charges_age <- ggplot(data_ready, aes(x = age, y = charges, color = chronic_condition)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ sex) +
  labs(
    title = "Ålder vs kostnad (chronic condition/icke-chronic condition",
    x = "Ålder",
    y = "Kostnad",
    color = "Chronic condition",
    shape = "Kön"
  )

print(p_charges_age)

#BMI vs kostnad och rökare

p_bmi <- ggplot(data_ready, aes(x = bmi, y = charges, color = smoker)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "BMI vs Kostnad (rökare/icke-rökare)",
    x = "BMI",
    y = "Kostnad",
    color = "Rökare"
  )

print(p_bmi)

#Historik

p_risk <- ggplot(data_ready, aes(x = high_risk, y = charges)) +
  geom_boxplot() +
  labs(
    title = "Risk vs kostnad",
    x = "Risk",
    y = "Kostnad"
  )

print(p_risk)

ggsave("figures/bmi.png", p_bmi, width = 8, height = 5)
ggsave("figures/charges.png", p_charges, width = 8, height = 5)
ggsave("figures/charges_age.png", p_charges_age, width = 8, height = 5)
ggsave("figures/risk.png", p_risk, width = 8, height = 5)
