#' wetest
#'
#' web element test
#' @param xpath xpath of webelem
#' @export
wetest <- function(xpath){
  remDr <- get("remDr",envir=globalenv())
  webElemtest <-NULL
  while(is.null(webElemtest)){
    webElemtest <- suppressMessages(tryCatch({remDr$findElement(using = 'xpath', xpath)},
                                             error = function(e){NULL}))
    #loop until element with name <value> is found in <webpage url>
  }
  randsleep <- sample(seq(.01, .02, by = 0.001), 1)
  Sys.sleep(randsleep)
}



