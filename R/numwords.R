#' numwords
#'
#' Count number of common words in two strings
#' @param str1 string or string vector 1
#' @param str2 string or string vector 2
#' @export
numwords <- function(str1, str2) {
  mapply(function(x, y) length(intersect(x, y)), 
         strsplit(str1, ' '), strsplit(str2, ' '))
}


