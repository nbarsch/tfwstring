#' localtstxt
#'
#' get ts local time as txt
#' @export
localtstxt <- function(){
  require(lubridate)
  return(as.character(as.integer(now(tzone="America/Denver"))))
}
