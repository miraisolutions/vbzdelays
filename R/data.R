#' Line data
#'
#' Returns departure and arrival data for a given `line`.
#'
#' @param line Scalar integer specifying the line.
#'
#' @return A `data.frame` with variables `line`, `date`, `weekday`, `hour`,
#'   `scheduled_departure`, `actual_departure`, `scheduled_arrival`,
#'   `actual_arrival`.
#'
#' @examples
#' data <- get_line_data(11)
#' head(data)
#' summary(data)
#'
#' @export
get_line_data <- function(line) {
  line_file <- system.file("line-data", sprintf("line-%d.rds", line), package = "vbzdelays")
  readRDS(line_file)
}
