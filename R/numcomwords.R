#' numcomwords
#'
#' number of common words between two strings
#' @param x data to recode from ASCII to latin
#' @param str1 string1
#' @param str2 string2
#' @export
numcomwords <- function(str1, str2) {
  mapply(function(x, y) length(intersect(x, y)),
         strsplit(str1, ' '), strsplit(str2, ' '))
}


