cat("Running .Rprofile\n")

# 2017-07-02 from nvimr plugin
if (Sys.getenv("NVIMR_TMPDIR") == "") {
  options(defaultPackages = c("utils", "grDevices", "graphics", "stats", "methods"))
} else {
  options(defaultPackages = c("utils", "grDevices", "graphics", "stats", "methods", "nvimcom"))
  # 2019-09-13 added nvimr_reload_html in ${HOME}/Scripts that is in ${PATH}
  options(browser = "nvimr_reload_html")
}

# Lines added by the Vim-R-plugin command :RpluginConfig (2014-Feb-16 18:42):
if (interactive()) {
  if (nchar(Sys.getenv("DISPLAY")) > 1) {
    options(editor = 'vim')
  } else {
    options(editor = 'vim')
  }
  library(colorout)
  if (Sys.getenv("TERM") != "linux" && Sys.getenv("TERM") != "") {
    # Choose the colors for R output among 256 options.
    # You should run show256Colors() and help(setOutputColors256) to
    # know how to change the colors according to your taste:
    setOutputColors256(verbose = FALSE)
  }
  library(utils)
  sessionInfo()
}

# ne marche pas tres bien
generate_base_lib_tags <- function() {
  .etagsfile <- tempfile()
  utils::rtags(path = "/usr/lib64/R/library", recursive = TRUE, ofile = ".etagsfile")
  nvimcom::etags2ctags(".etagsfile", "~/.rtags/base_pkg.ctags")
  rm(list = ".etagsfile")
}
