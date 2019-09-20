data <- data.frame(
  scheduled_departure = c(1, 2)*60,
  actual_departure = c(3, 6)*60,
  scheduled_arrival = c(2, 3)*60,
  actual_arrival = c(6, 11)*60
)

test_that("delays are computed correctly", {
  res <- compute_delay(data)
  expect_equal(res$delay, c(3, 6))
})

