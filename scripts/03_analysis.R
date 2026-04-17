#3) Beskrivande analys

# Försäkringskostnader

charges_summary <- data_ready %>%
  summarize(
    avg_charges = mean(charges, na.rm = TRUE),
    median_charges = median(charges, na.rm = TRUE),
    sd_charges = sd(charges, na.rm = TRUE),
    min_charges = min(charges, na.rm = TRUE),
    q1_charges = quantile(charges, 0.25, na.rm = TRUE),
    q3_charges = quantile(charges, 0.75, na.rm = TRUE),
    max_charges = max(charges, na.rm = TRUE),
  )

charges_summary


# T-test på historik

risk_test <- t.test(charges ~ high_risk, data = data_ready)

risk_test
risk_test$p.value
risk_test$conf.int
risk_test$estimate