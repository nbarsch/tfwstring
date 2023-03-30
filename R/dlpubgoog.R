#' dlpubgoog
#'
#' download a public google sheet link as csv
#' @param ss ss of google sheet
#' @param sheet sheet
#' @param destfile destfile
#' @export
dlpubgoog <- function(ss,sheet,destfile){
  download.file(paste0("https://docs.google.com/spreadsheets/d/",ss,"/gviz/tq?tqx=out:csv&sheet=",sheet),destfile=destfile)
}

