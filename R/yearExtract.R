#' yearExtract()
#' extract year from string
#' @param string string to extract from
#' @export
yearExtract <- function(string) {
  t <- regmatches(string, regexec("[0-9]{4}", string))
  sapply(t, function(x) {
    if(length(x) > 0){
      return(as.numeric(x))
    } else {
      return("")    
    }
  })
}