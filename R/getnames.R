#' getnames()
#'
#'
#' Get names from a string
#' @param namestring string with up to two names separated by '&', 'and' or '+'
#' @export
getnames <- function(namestring){
  library(stringr)
  orignamestring <- gsub("  "," ",namestring)
  namestring <- gsub("  "," ",namestring)
  ###test for two names
  plusin <-  grepl("\\+",namestring)
  if(isTRUE(plusin)){
    namestring <- gsub("\\+","&",namestring)
  }
  andin <-  grepl(" and ",tolower(namestring))
  if(isTRUE(andin)){
    namestring <- gsub(" and ","&",namestring)
  }
  orin<-  grepl(" or ",tolower(namestring))
  if(isTRUE(orin)){
    namestring <- gsub(" or ","&",namestring)
  }
  twonames <- grepl("&",namestring)


  if(isTRUE(twonames)){
    namefull1 <- unlist(strsplit(namestring,"&"))[1]
    namefull2 <- unlist(strsplit(namestring,"&"))[2]
    namefull1 <- gsub("[[:punct:]]","",namefull1)
    namefull2 <- gsub("[[:punct:]]","",namefull2)
    nwords1 <- sapply(strsplit(namefull1, " "), length)
    nwords2 <- sapply(strsplit(namefull2, " "), length)

    if(nwords1==1 & nwords2>1){
      namefull1 <- paste0(namefull1," ",word(namefull2,-1,-1))
    }
  }else{
    namefull1 <- namestring
    namefull2 <- NA
  }

  appendix1 <- NA
  appendix2 <- NA

  namefull1 <- paste0(namefull1," ")
  namefull1 <- gsub("[[:punct:]]","",namefull1)
  namefull11 <- gsub(" Jr ","",namefull1)
  if(nchar(namefull11)<nchar(namefull1)){
    appendix1 <- "Jr"
    namefull1 <- namefull11
  }
  namefull11 <- gsub(" Sr ","",namefull1)
  if(nchar(namefull11)<nchar(namefull1)){
    appendix1 <- "Sr"
    namefull1 <- namefull11
  }
  namefull11 <- gsub(" I ","",namefull1)
  if(nchar(namefull11)<nchar(namefull1)){
    appendix1 <- "I"
    namefull1 <- namefull11
  }
  namefull11 <- gsub(" II ","",namefull1)
  if(nchar(namefull11)<nchar(namefull1)){
    appendix1 <- "II"
    namefull1 <- namefull11
  }
  namefull11 <- gsub(" III ","",namefull1)
  if(nchar(namefull11)<nchar(namefull1)){
    appendix1 <- "III"
    namefull1 <- namefull11
  }
  namefull1 <- trimws(namefull1)

  if(!is.na(namefull2)){

    namefull2 <- paste0(namefull2," ")
    namefull2 <- gsub("[[:punct:]]","",namefull2)
    namefull21 <- gsub(" Jr ","",namefull2)
    if(nchar(namefull21)<nchar(namefull2)){
      appendix2 <- "Jr"
      namefull2 <- namefull21
    }
    namefull21 <- gsub(" Sr ","",namefull2)
    if(nchar(namefull21)<nchar(namefull2)){
      appendix2 <- "Sr"
      namefull2 <- namefull21
    }
    namefull21 <- gsub(" I ","",namefull2)
    if(nchar(namefull21)<nchar(namefull2)){
      appendix2 <- "I"
      namefull2 <- namefull21
    }
    namefull21 <- gsub(" II ","",namefull2)
    if(nchar(namefull21)<nchar(namefull2)){
      appendix2 <- "II"
      namefull2 <- namefull21
    }
    namefull21 <- gsub(" III ","",namefull2)
    if(nchar(namefull21)<nchar(namefull2)){
      appendix2 <- "III"
      namefull2 <- namefull21
    }
    namefull2 <- trimws(namefull2)

  }

  fname1 <- word(namefull1,1,1)
  lname1 <- word(namefull1,-1,-1)
  if(nchar(fname1)==1){ftype1 <- "initial"}else{ftype1 <- "name"}
  if(nchar(lname1)==1){ltype1 <- "initial"}else{ltype1 <- "name"}
  nwords1 <- sapply(strsplit(namefull1, " "), length)
  if(nwords1==1){
    ftype1 <- paste0(ftype1,"ONE")
    ltype1 <- paste0(ltype1,"ONE")
  }


  if(!is.na(namefull2)){
    fname2 <- word(namefull2,1,1)
    lname2 <- word(namefull2,-1,-1)
    if(nchar(fname2)==1){ftype2 <- "initial"}else{ftype2 <- "name"}
    if(nchar(lname2)==1){ltype2 <- "initial"}else{ltype2 <- "name"}
    nwords2 <- sapply(strsplit(namefull2, " "), length)
    if(nwords2==1){
      ftype2 <- paste0(ftype2,"ONE")
      ltype2 <- paste0(ltype2,"ONE")
    }
  }else{
    fname2 <- NA
    lname2 <- NA
    ftype2 <- NA
    ltype2 <- NA
  }

  td <- data.frame(orignamestring=orignamestring, fullname1=namefull1, fname1=fname1, ftype1=ftype1, lname1=lname1,ltype1=ltype1, appendix1=appendix1, fullname2=namefull2, fname2=fname2, ftype2=ftype2, lname2=lname2,ltype2=ltype2, appendix2=appendix2, stringsAsFactors = F )
  td[] <- lapply(td, function(x) gsub("  ", " ", x))
  return(td)
}


#TESTING
# namestring <- "Neal Barsch + Einstein Doglname"
#
#
# namestring <- "Neal Barsch Jr."
# getnames(namestring=namestring)
#
# namestring <- "Neal Barsch I & Einstein Barsch"
# getnames(namestring=namestring)
#
# namestring <- "Neal T Barsch"
# getnames(namestring=namestring)
#
# namestring <- "Neal & Einstein Barsch"
# getnames(namestring=namestring)
#
# namestring <- "Neal"
# getnames(namestring=namestring)
#
# namestring <- "N Barsch"
# getnames(namestring=namestring)
#
#namestring <- "N & Einstein Bar"
#getnames(namestring=namestring)

