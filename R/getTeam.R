#' getTeam()
#'
#'
#' Get unified team name and data from any format team name 
#' @param teamname string name of team in any format
#' @param out string 'teamonly' or 'to' for only team name or 'all' for data.frame of all team data
#' @param upper logical return team in upper case
#' @param print logical print team name in addition to return
#' @export
getTeam <- function(teamname, out="teamonly", upper=TRUE, print=TRUE){
  
  if(!file.exists("temp_allproteams.csv")){
    download.file("https://docs.google.com/spreadsheets/d/1yKbZ5a9nbCx6wx7mAdTu9WJWEuHhTB8noGCHtm_7Jws/gviz/tq?tqx=out:csv&sheet=proteams",destfile="temp_allproteams.csv")
  }
  
  tteams <- read.csv("temp_allproteams.csv")
  tmatch1 <- which(toupper(tteams$teamonly2)==toupper(teamname))
  if(length(tmatch1)==0){
    tteams$tecmatchnum<- ncw(toupper(teamname),toupper(tteams$teamonly2))
    testmax1 <- max(as.numeric(tteams$tecmatchnum))
    if(testmax1>0){
      tmatch1 <- which.max(tteams$tecmatchnum)
    }else{tmatch1 <- numeric(length=0L)}
  }
  
  if(length(tmatch1)>0){
    
    
    if(out=="to"){
      out <- "teamonly"
    }
    if(out=="teamonly"){
      outp <- as.character(tteams$teamonly2[tmatch1[1]])
      if(isTRUE(upper)){
        outp <- toupper(outp)
      }
      if(isTRUE(print)){
        print(outp)
      }
      return(outp)
    }
    
    if(out=="ct"){
      out <- "cityteam"
    }
    if(out=="cityteam"){
      outt1 <- as.character(tteams$teamonly2[tmatch1[1]])
      outt2 <- as.character(tteams$cityonly2[tmatch1[1]])
      outp <- paste0(outt2," ",outt1)
      if(isTRUE(upper)){
        outp <- toupper(outp)
      }
      if(isTRUE(print)){
        print(outp)
      }
      return(outp)
    }
    
    if(out=="all"){
  
      if(isTRUE(upper)){
        tteams$teamonly2 <- toupper(as.character(tteams$teamonly2))
        tteams$cityonly2 <- toupper(as.character(tteams$cityonly2))
      }
      if(isTRUE(print)){
        print(tteams[tmatch1,])
      }
      return(tteams[tmatch1,])
      
    }
  }else{
    print(teamname)
    return(paste0(teamname))
  }

  
  
}
