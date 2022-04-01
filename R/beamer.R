#' Beamer presentation template
#'
#' @param dir_output The path of the directory in which the R Markdown document
#'    and its support files should be created.
#' @param rmd_name The name of the R Markdown file (without file extension).
#' @param open_rmd Logical, whether to open the R Markdown file after it has
#'    been created.
#'
#' @importFrom fs dir_exists path path_package file_copy file_show
#' @importFrom checkmate assert_string assert_flag
#'
#' @export
tmpl_beamer = function(dir_output = getwd(),
                       rmd_name   = "beamer",
                       open_rmd   = TRUE) {
  # Sanity checks
  assert_string(dir_output)
  if (!dir_exists(dir_output)) {
    stop("`dir_output` must be an existing directory.")
  }
  assert_string(rmd_name)
  assert_flag(open_rmd)

  # Source files
  dir_beamer    = path_package("david.rmd", "rmarkdown", "templates", "beamer", "skeleton")
  file_rmd      = path(dir_beamer, "skeleton", ext = "Rmd")
  file_preamble = path(dir_beamer, "preamble", ext = "tex")

  # Copy files to destination folder (and with desired file name for .Rmd file)
  file_copy(
    file_rmd,
    path(dir_output, rmd_name, ext = "Rmd")
  )
  file_copy(file_preamble, dir_output)

  if (open_rmd) file_show(path(dir_output, rmd_name, ext = "Rmd"))
}


