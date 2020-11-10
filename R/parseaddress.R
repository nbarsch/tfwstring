#' parseaddress()
#'
#' Get address parts from a string address. 
#' @param address string of address to parse
#' @param check_python TRUE or FALSE, TRUE=do check for python dependencies and install if missing, FALSE is faster if you have already installed python3 and module usaddress
#' @param force_stateabb TRUE or FALSE, if TRUE state names are forced to abbreviation format for unified format
#' @export
parseaddress <- function(address, check_python=TRUE, force_stateabb=TRUE){
  
  if(isTRUE(check_python)){
    system("sudo apt-get install python3-pip -y -qq > /dev/null")
    system("sudo pip3 install usaddress -qq > /dev/null")
  }
  if(!require("reticulate")){install.packages("reticulate")}
  library(reticulate)
  
  if(isTRUE(force_stateabb)){
    statein <- which(as.logical(sapply(tolower(state.name), FUN=function(x){grepl(x,tolower(address))}))==TRUE)
    if(length(statein)>0){
      stabb <- state.abb[statein]
      stname <- toupper(state.name[statein])
      address <-gsub(stname,stabb,toupper(address))
    }
  }
  
  py_run_string("
import usaddress
def adusapy(x):
  return usaddress.tag(x)
              ")
  
  #t <- "3777 S Albion St unit 2 Cherry Hills Village, CO 80113"
  return(unlist(py$adusapy(address)))
  
  
  
}

