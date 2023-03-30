#' clickall
#'
#' clickall web element
#' @param  elems list of webelem
#' @export
clickall <- function(elems){
  lapply(c(1:length(elems)),FUN=function(x){elems[[x]]$clickElement()})
}
