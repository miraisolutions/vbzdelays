#' @import dplyr
compute_delay <- function(data) {
  data %>%
    mutate(
      delay = mean(c((actual_departure - scheduled_departure),
                     (actual_arrival - scheduled_arrival))) / 2 / 60
    )
}

#' @import dplyr
count_delays_by_weekday_hour <- function(data, delay_breaks = 1:5) {
  data %>%
    group_by(
      weekday,
      hour = cut(hour, 0:48, labels = ifelse(0:47 < 24, 0:47, paste0("+", floor(0:47) - 24))),
      delay = cut(delay, c(-Inf, delay_breaks, Inf))
    ) %>%
    summarize(count = n()) %>%
    group_by(weekday, hour) %>%
    mutate(freq = count / sum(count))
}
