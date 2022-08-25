#' getNCAATeam()
#'
#'
#' Get unified team name and data from any format team name 
#' @param teamname string name of team in any format
#' @export
getNCAATeam <- function(teamname){
  
  if(!file.exists("temp_allncaateams.csv")){
    download.file("https://docs.google.com/spreadsheets/d/1yKbZ5a9nbCx6wx7mAdTu9WJWEuHhTB8noGCHtm_7Jws/gviz/tq?tqx=out:csv&sheet=ncaateams",destfile="temp_allncaateams.csv")
  }
  
  tteams <- read.csv("temp_allncaateams.csv")
  match1 <- which(toupper(tteams$college)==toupper(teamname))
  if(length(match1)==0){
    match1 <- which(toupper(tteams$teamfull)==toupper(teamname))
  }
  if(length(match1)==0){
    matchvec <- sapply(c(1:nrow(tteams)),FUN=function(x){numwords(teamname,tteams$teamfull[x])})
    if(length(matchvec)>0){
      if(max(matchvec)>0){
        match1 <- which.max(matchvec)[1]
      }else{match1 <- numeric(length=0)}
    }
  }
  if(length(match1)>0){
    outp <- toupper(tteams$uniname[match1])
  }else{
    outp <- toupper(teamname)
  }
  return(outp)
  
}
