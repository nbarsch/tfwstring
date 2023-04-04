#' wetest
#'
#' web element test
#' @param xpath xpath of webelem
#' @export
wetest <- function(xpath){
  remDr <- get("remDr",envir=globalenv())
  webElemtest <-NULL
  wer <- 1
  while(is.null(webElemtest)){
    webElemtest <- suppressMessages(tryCatch({remDr$findElement(using = 'xpath', xpath)},
                                             error = function(e){NULL}))
    rs(.2,.5)
    wer <- wer+1
    if(wer>30){
      webElemtest <- "NF"
    }
    #loop until element with name <value> is found in <webpage url>
  }

  randsleep <- sample(seq(.01, .02, by = 0.001), 1)
  Sys.sleep(randsleep)

}



