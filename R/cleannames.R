#' cleannames()
#'
#'
#' clean names from a string
#' @param name string with name or name vector
#' @param toup required=TRUE converts names to uppercase
#' @param blankcompany convert names with company characteristics such as LLC, TRUST, etc. to BLANK
#' @param rmcompanytxt remove company characteristics from names
#' @param rm12letter if TRUE one and two letter words such as middle initial are removed
#' @export
cleannames <- function(name, toup=TRUE, rmcompanytxt=TRUE, blankcompany=TRUE, rm12letter=TRUE){
  require(stringr)
  require(qdapRegex)
  require(foreach)
  name <- iconv(name,from="utf-8",to="utf-8",sub=' ')
  name <- gsub("[[:punct:]]"," ",name)
  name <- rm_white(name)
  if(isTRUE(toup)){
    name <- toupper(name)
  }
  if(isTRUE(blankcompany)){
    name <- paste0(" ",name," ")
    name[grep(" LLC ",name)] <-""
    name[grep(" TRUST ",name)] <-""
    name[grep(" COMPANY ",name)] <-""
    name[grep(" REAL ESTATE ",name)] <-""
    name[grep(" REALTOR ",name)] <-""
    name[grep(" INC ",name)] <-""
    name[grep(" PARTNERS ",name)] <-""
    name[grep(" PROPERTIES ",name)] <-""
    name[grep(" PROPERTY ",name)] <-""
    name[grep(" AGENT ",name)] <-""
    name[grep(" LISTING ",name)] <-""
    name[grep(" PARTNERSHIP ",name)] <-""
    name[grep(" PARTNERS ",name)] <-""
    name[grep(" GROUP ",name)] <-""
    name[grep(" SERVICES ",name)] <-""
    name[grep(" SERVICE ",name)] <-""
    name[grep(" MANAGEMENT ",name)] <-""
    name[grep(" MANAGING ",name)] <-""
    
  }
  if(isTRUE(rmcompanytxt)){
    name <- paste0(" ",name," ")
    name <- gsub(" LLC "," ",name)
    name <- gsub(" TRUST "," ",name)
    name <- gsub(" COMPANY "," ",name)
    name <- gsub(" REAL ESTATE "," ",name)
    name <- gsub(" REALTOR "," ",name)
    name <- gsub(" INC "," ",name)
    name <- gsub(" PROPERTIES "," ",name)
    name <- gsub(" PROPERTY "," ",name)
    name <- gsub(" AGENT "," ",name)
    name <- gsub(" LISTING "," ",name)
    name <- gsub(" LLC "," ",name)
    name <- gsub(" PARTNERS "," ",name)
    name <- gsub(" PARTNERSHIP "," ",name)
    name <- gsub(" SERVICES "," ",name)
    name <- gsub(" SERVICE "," ",name)
    
  }
  if(isTRUE(rm12letter)){
    name <- gsub(" *\\b[[:alpha:]]{1,2}\\b *", " ", name) # Remove 1-2 letter words
    name <- gsub("^ +| +$|( ) +", "\\1",name)
    name <- str_squish(gsub("[[:punct:]]"," ",name))
  }
  return(trimws(rm_white(name)))
}