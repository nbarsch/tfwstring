#' ac
#'
#' Convert data to all character columns
#' @param data what data to convert
#' @export
ac <- function(data){
  dataobj <- get(data)
  require(dplyr)
  dataobj %>% mutate_all(as.character)->datachar
  return(datachar)
}

