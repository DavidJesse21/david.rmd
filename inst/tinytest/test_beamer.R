oldwd = getwd()
tmp   = fs::path_temp()
setwd(tmp)

# Create beamer template presentation files.
tmpl_beamer(rmd_name = "my_presentation", open_rmd = FALSE)

# Files should now exist in the current working directory.
expect_true(fs::file_exists("my_presentation.Rmd"))
expect_true(fs::file_exists("preamble.tex"))

# Prevent unintended side effects for other tests
fs::dir_delete(fs::dir_ls(type = "directory"))
fs::file_delete(fs::dir_ls(type = "file"))
setwd(oldwd)
