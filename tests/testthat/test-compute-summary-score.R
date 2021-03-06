context("Compute summary score")
library(glider)

test_that("compute_summary_score computes a sum score correctly", {
  stress <- data.frame(
    subject_id = c(1:3),
    physical_stress_1 = c(3, 5, 1),
    physical_stress_2 = c(2, 3, 2)
  )

  physical_stress_sum <- c(5, 8, 3)
  id <- c(1:3)

  expect_setequal(compute_summary_score(df = stress, pattern = "^physical_stress", score_name = "physical_stress_sum", score_type = "sum")[["physical_stress_sum"]], physical_stress_sum)
  expect_setequal(compute_summary_score(df = stress, pattern = "^physical_stress", score_name = "physical_stress_sum", score_type = "sum")[["subject_id"]], id)
})



test_that("compute_summary_score computes a mean score correctly", {
  stress <- data.frame(
    subject_id = c(1:3),
    physical_stress_1 = c(3, 5, 1),
    physical_stress_2 = c(2, 3, 2)
  )

  physical_stress_mean <- c(2.5, 4, 1.5)
  id <- c(1, 2, 3)

  expect_setequal(compute_summary_score(df = stress, pattern = "^physical_stress", score_name = "physical_stress_mean", score_type = "average")[["physical_stress_mean"]], physical_stress_mean)
  expect_setequal(compute_summary_score(df = stress, pattern = "^physical_stress", score_name = "physical_stress_mean", score_type = "average")[["subject_id"]], id)
})
