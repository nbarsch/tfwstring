#' ceclickopen
#'
#' clickall web element
#' @export
ceclickopen <- function(){
  remDr <- get("remDr")
  listicon <- remDr$findElements(using="xpath","//button[@class='listIconWrapper']")
  clickall(elems=listicon)
  rs(.1,.2)

  viewmore <- remDr$findElements(using="xpath","//button[text()='View More']")
  clickall(elems=viewmore)
  rs(.1,.2)
}
