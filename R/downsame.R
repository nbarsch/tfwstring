#' downsame
#'
#' scroll down until test element tests same length as before
#' @param xpath xpath of elem to count to test
#' @export
downsame <- function(xpath){
  #scroll to bottom of page
  tl1 <- length(gh(xpath=xpath))
  webElem <- remDr$findElement("css", "body")
  webElem$sendKeysToElement(list(key = "end"))
  rs()
  #top of page
  webElem <- remDr$findElement("css", "body")
  webElem$sendKeysToElement(list(key = "home"))
  rs()
  #scroll to bottom of page
  webElem <- remDr$findElement("css", "body")
  webElem$sendKeysToElement(list(key = "end"))
  rs()
  #top of page
  webElem <- remDr$findElement("css", "body")
  webElem$sendKeysToElement(list(key = "home"))
  rs()
  tl2 <- length(gh(xpath=xpath))
  while(tl1!=tl2){
    tl1 <- length(gh(xpath=xpath))
    webElem <- remDr$findElement("css", "body")
    webElem$sendKeysToElement(list(key = "end"))
    rs()
    #top of page
    webElem <- remDr$findElement("css", "body")
    webElem$sendKeysToElement(list(key = "home"))
    rs()
    #scroll to bottom of page
    webElem <- remDr$findElement("css", "body")
    webElem$sendKeysToElement(list(key = "end"))
    rs()
    #top of page
    webElem <- remDr$findElement("css", "body")
    webElem$sendKeysToElement(list(key = "home"))
    rs()
    tl2 <- length(gh(xpath=xpath))
  }
}


