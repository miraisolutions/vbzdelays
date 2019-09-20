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


#' Available lines
#'
#' Returns the lines for which data are available.
#'
#' @examples
#' available_lines()
#'
#' @import dplyr
#' @export
available_lines <- function() {
  pattern <- "^line-(\\d+)[.]rds$"
  list.files(system.file("line-data", package = "vbzdelays"), pattern) %>%
    sub(pattern, "\\1", .) %>%
    as.integer() %>%
    sort()
}
