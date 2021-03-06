#' exsubtxt()
#' extract parts from a string based on defined string split
#' @param string string to split on to find what to extract
#' @param ps page source in text unlisted to find what to extract 
#' @param nchar number of characters from located string forward to extract
#' @param firstonly if TRUE returns only first instance of extract
#' @export
exsubtxt <- function(string,nchar=100,ps,firstonly=F){
  startchar <- str_locate_all(ps,string)[[1]]
  if(!isTRUE(firstonly)){
    return(sapply(c(1:nrow(startchar)),FUN=function(x){substr(ps,startchar[x],startchar[x]+nchar)}))
  }else{
    return(substr(ps,startchar[1],startchar[1]+nchar))
  }
}
