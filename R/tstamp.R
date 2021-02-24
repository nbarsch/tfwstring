#' ts()
#'
#' Generate a timestamp in milliseconds unique with same number of characters every time
#'

#' @export
tstamp <- function(){
  return(as.numeric(as.POSIXct(Sys.time())))
}
