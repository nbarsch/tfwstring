#' recol
#'
#' rename column
#' @param dataset dataset
#' @param oldname what old col name
#' @param newname new col name
#' @export
recol <- function(dataset, oldname, newname){
  names(dataset)[names(dataset)==paste0(oldname)] <- newname
  return(dataset)
}

