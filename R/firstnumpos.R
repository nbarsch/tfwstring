#' firstnumpos
#'
#' Identify word position of first number in string
#' @param str1 string 1
#' @export
firstnumpos <- function(str1){
  min(which(!is.na(suppressWarnings(as.numeric(str_split(trimws(gsub("  "," ",str1)), " ", simplify = TRUE))))))
}
