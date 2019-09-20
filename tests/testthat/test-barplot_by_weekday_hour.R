set.seed(12358)
delays <- expand.grid(
  weekday = c("Mon", "Tue"),
  hour = 8:10,
  delay = cut(1:3, 0:10)
)
delays$count = sample.int(100, nrow(delays), replace = TRUE)
delays$freq = runif(nrow(delays))
test_that("plotting function works", {
  p <- barplot_by_weekday_hour(delays)
  expect_is(p, "ggplot")
})
