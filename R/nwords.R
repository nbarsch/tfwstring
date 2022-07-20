#' nwords
#'
#' Count number of words in string
#' @param str string or string vector 1
#' @export
nwords <- function(str) {
  length(unlist(strsplit(trimws(rm_white(str))," ")))
}


