#' ceclickopen
#'
#' clickall web element
#' @export
ceclickopen <- function(){
  remDr <- get("remDr")
  listicon <- remDr$findElements(using="xpath","//button[@class='listIconWrapper']")
  if(length(listicon)>0){
    clickall(elems=listicon)
    rs(.1,.2)
  }
  viewmore <- remDr$findElements(using="xpath","//button[text()='View More']")
  if(length(viewmore)>0){
    clickall(elems=viewmore)
    rs(.1,.2)
  }
}
