#' mcw
#'
#' Match of common words in two strings
#' @param str1 string or string vector 1
#' @param str2 string or string vector 2
#' @export
mcw <- function(str1, str2) {
  mapply(function(x, y) paste0(intersect(x, y),collapse = " "), 
         strsplit(str1, ' '), strsplit(str2, ' '))
}


