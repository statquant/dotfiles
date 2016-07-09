cat('Running .Rprofile from ~/.R\n')

# Lines added by the Vim-R-plugin command :RpluginConfig (2014-Feb-16 18:42):
if(interactive()){
    if(nchar(Sys.getenv("DISPLAY")) > 1)
        options(editor = 'gvim -f -c "set ft=r"')
    else
        options(editor = 'vim -c "set ft=r"')
    library(colorout)
    if(Sys.getenv("TERM") != "linux" && Sys.getenv("TERM") != ""){
        # Choose the colors for R output among 256 options.
        # You should run show256Colors() and help(setOutputColors256) to
        # know how to change the colors according to your taste:
        setOutputColors256(verbose = FALSE)
    }
    library(setwidth)
	library(utils)
	sessionInfo()
}

.Last <- function(){
	installedSources <- file.path(tempdir(),'downloaded_packages')
	packages <- list.files(installedSources, full.names=TRUE)
	if(length(packages)>0){
		copyPackage <- function(package){
			cat('source',package,'will be copied to',Sys.getenv('R_SOURCES_USER'),'\n')
			file.copy(packages, to=Sys.getenv('R_SOURCES_USER'))
		}
		success <- sapply(packages, FUN=copyPackage)
		success <- stack(success)
		colnames(success) <- c('successfullt copied','package')
		return(success)
	}
}

