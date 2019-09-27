#' Line report
#'
#' Render the delay analysis HTML report for a given `line`.
#'
#' @inheritParams get_line_data
#' @param output_dir The output directory for the rendered report.
#' @param ... Additional arguments to be passed to [rmarkdown::render()].
#'
#' @return The path to the rendered report.
#'
#' @examples
#' report <- render_line_report(line = 11, tempdir())
#' browseURL(report)
#'
#' @export
render_line_report <- function(line, output_dir = ".", ...) {
  report_file <- system.file("reports", "line-report.Rmd", package = "vbzdelays")
  params <- structure(list(line = line), class = "knit_param")
  rmarkdown::render(report_file, output_dir = output_dir, params = params, ...)
}
