#' Render Site
#'
#' Create a website as collection of reports for all lines.
#'
#' @param output_dir The output directory where the website is created. Defaults
#'   to `"_site"`. The parent directory must exist.
#' @param ... Additional arguments to be passed to [bookdown::render_book()].
#'
#' @return The path to the `index.html` file of the created website.
#'
#' @export
render_site <- function(output_dir = "_site", ...) {
  # absolute path of output_dir (which must exist)
  dir.create(output_dir)
  output_dir <- normalizePath(output_dir)
  input_dir <- system.file("site", package = "vbzdelays")
  restore_dir <- setwd(input_dir) # returns the wd before the call
  on.exit(setwd(restore_dir), add = TRUE)
  bookdown::render_book(".", output_dir = output_dir, clean_envir = FALSE, ...)
}
