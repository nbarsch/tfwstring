#' redoenc
#'
#' redo encoding
#' @param x data to recode from ASCII to latin
#' @param fromenc from encoding
#' @param toenc to encoding
#' @param type vec or df
#' @export
redoenc <- function(x,fromenc="ASCII",toenc="latin1",sub="",type="vec"){
  if(type=="vec"){
    Encoding(x) <- "ASCII"
    x <- iconv(x, fromenc, toenc,sub='')
  }
  if(type=="df"){
    dplyr::mutate_if(x, is.character, .funs = function(xx){return(`Encoding<-`(xx, "latin1"))})
  }
  return(x)
}


