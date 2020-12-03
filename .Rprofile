cat(sprintf("This is %s PID %s\n", R.version.string, Sys.getpid()))
cat("Running .Rprofile\n")


local({
  repos <- c(CRAN = "https://cloud.r-project.org")
  if (.Platform$OS.type == "windows") {
     repos["CRANextra"] <- "https://www.stats.ox.ac.uk/pub/RWin"
  }
  options(repos = c(repos, getOption("repos")))
})

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
}

# ne marche pas tres bien
generate_base_lib_tags <- function() {
  .etagsfile <- tempfile()
  utils::rtags(path = "/usr/lib64/R/library", recursive = TRUE, ofile = ".etagsfile")
  nvimcom::etags2ctags(".etagsfile", "~/.rtags/base_pkg.ctags")
  rm(list = ".etagsfile")
}

options_error <- function() {                                                               
    x <- sys.calls()                                                                        
    nb <- length(x)                                                                         
    if (nb >= 3L) {                                                                         
        sink(stderr())                                                                      
        on.exit(sink(NULL))                                                                 
        for (i in 1L:(nb-1)) {                                                              
            num <- formatC(i, width = floor(1 + log10(nb)), format = "d", flag = "0")       
            spaces <- paste(rep("   ", times = max(0, i - 2)), collapse = "")               
            dashs <- ifelse(i == 1, "", "+--")                                              
            lead <- sprintf("%s. %s%s+", num, spaces, dashs)                                
            code <- gsub(paste(x[i], collapse = " "), pattern = "\\s+", replacement = " ")  
            cat(lead, code, "\n")                                                           
            spaces <- paste(rep("   ", times = max(0, i - 1)), collapse = "")               
            srcloc <- if (!is.null(srcref <- attr(x[[i]], "srcref"))) {                     
                sprintf("%s %s:%s", attr(srcref, "srcfile")$filename, srcref[1L], srcref[2])
            }                                                                               
            if (!is.null(srcloc)) {                                                         
                loc <- sprintf("  %s | > %s", spaces, srcloc)                               
            } else {                                                                        
                loc <- sprintf("  %s | > %s", spaces, "???")                                
            }                                                                               
            cat(loc, "\n")                                                                  
        }                                                                                   
    }                                                                                       
    if (!interactive()) {                                                                   
        q(status = 1)                                                                       
    }                                                                                       
    invisible(x)                                                                            
}
options(error = options_error)
