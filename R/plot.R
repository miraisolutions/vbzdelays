#' @import dplyr
#' @import ggplot2
barplot_by_weekday_hour <- function(delays) {
  coverage_data <- delays %>%
    group_by(weekday, hour) %>%
    summarize(coverage = sprintf("%.0f%%", sum(freq)*100))
  ggplot(delays, aes(x = hour, y = count)) +
    geom_col(aes(fill = delay), position = "fill") +
    geom_text(data = coverage_data, aes(label = coverage, y = 1), size = 2.5, vjust = 1) +
    lemon::facet_rep_wrap(~weekday, ncol = 1, repeat.tick.labels = TRUE) +
    theme(legend.justification = "top")
}


#' Weekday-hour delay barplot
#'
#' Create a barplot of normalized delay counts by hour for each weekday.
#'
#' @param data Arrival and departure data (see [get_line_data()]).
#'
#' @examples
#' data <- get_line_data(11)
#' plot_delays_by_weekday_hour(data)
#'
#' @import dplyr
#' @export
plot_delays_by_weekday_hour <- function(data) {
  data %>%
    compute_delay() %>%
    count_delays_by_weekday_hour() %>%
    filter(delay != "(-Inf,1]") %>%
    barplot_by_weekday_hour()
}
