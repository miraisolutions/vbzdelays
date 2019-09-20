#' @import dplyr
#' @import ggplot2
barplot_by_weekday_hour <- function(delays) {
  ggplot(delays, aes(x = hour, y = count)) +
    geom_col(aes(fill = delay), position = "fill") +
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
#' @import ggplot2
#' @export
plot_delays_by_weekday_hour <- function(data) {
  data %>%
    compute_delay() %>%
    count_delays_by_weekday_hour() %>%
    filter(delay != "(-Inf,1]") %>%
    barplot_by_weekday_hour()
}
