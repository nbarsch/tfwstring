#' convitime2
#'
#' Convert time from everything
#' @param time string of time
#' @export
convitime2 <- function(time, clock24=TRUE){
  
  time <- toupper(time)
  if(nrow(data.frame(str_locate_all(word(time,1,1),"\\/")))==2){
    time <- gsub("\\/","-",time)
    ftime <- mdy_hm(time)
    hour24 <- hour(ftime)
    timeofday <- hour24
    hour <- hour24
    if(nchar(timeofday)==1){timeofday <- paste0("0",timeofday)}
    daynum <- day(ftime)
    if(nchar(daynum)==1){daynum <- paste0("0",daynum)}
    month <- month(ftime)
    if(nchar(month)==1){month <- paste0("0",month)}
    year <- year(ftime)
    #return(data.frame(time=timeofday, hour=hour, day=daynum, month=month, year=year, stringsAsFactors = F))
    
  }else{
    char1 <- str_sub(time,-1,-1)
    
    
    cdown <- FALSE
    
    lastalpha <-isTRUE(char1=="M")
    
    if(isTRUE(lastalpha)){
      char2 <- str_sub(time,-2,-2)
      lastnum <- isTRUE(nchar(rpt(char2))>0)
      if(lastnum==TRUE){cdown <- TRUE}
    }
    
    if(cdown==TRUE){
      ###IS A COUNTDOWN CLOCK
      
      year <- as.character(year(now()))
      month <- as.character(month(now()))
      daynum <- as.character(day(now()))
      ncwords <- nwords(time)
      if(ncwords>2){
        year <- "NF"
        month <- "NF"
        daynum <- "NF"
        hour <- "NF"
        timeofday <- "NF"
      }
      if(ncwords==1){
        nmin <- as.numeric(rpt(time))
        nsec <- nmin*60
        hour <- hour(now()+nsec)
        if(hour>12){ampm <- "PM"}else{ampm <- "AM"}
        if(hour==13){hour <-"01"}
        if(hour==14){hour <-"02"}
        if(hour==15){hour <-"03"}
        if(hour==16){hour <-"04"}
        if(hour==17){hour <-"05"}
        if(hour==18){hour <-"06"}
        if(hour==19){hour <-"07"}
        if(hour==20){hour <-"08"}
        if(hour==21){hour <-"09"}
        if(hour==22){hour <-"10"}
        if(hour==23){hour <-"11"}
        if(hour==24){hour <-"12"}
        timeofday <- paste0(hour,ampm)
      }
      if(ncwords==2){
        htime <- word(time,1,1)
        if(str_sub(htime,-1,-1)=="H"){
          nhours <- as.numeric(rpt(htime))
          haddmin <- nhours*60
          haddsec <- haddmin*60
          time <- word(time,2,2)
        }else{haddsec<-0}
        
        nmin <- as.numeric(rpt(time))
        nsec <- nmin*60
        hour <- hour(now()+nsec+haddsec)
        if(hour>12){ampm <- "PM"}else{ampm <- "AM"}
        if(hour==13){hour <-"01"}
        if(hour==14){hour <-"02"}
        if(hour==15){hour <-"03"}
        if(hour==16){hour <-"04"}
        if(hour==17){hour <-"05"}
        if(hour==18){hour <-"06"}
        if(hour==19){hour <-"07"}
        if(hour==20){hour <-"08"}
        if(hour==21){hour <-"09"}
        if(hour==22){hour <-"10"}
        if(hour==23){hour <-"11"}
        if(hour==24){hour <-"12"}
        timeofday <- paste0(hour,ampm)
        
      }
      
      #now()+100  #adds seconds
      #return(data.frame(time=timeofday, hour=hour, day=daynum, month=month, year=year, stringsAsFactors = F))
      
      
    }else{
      
      ### NOT A COUNTDOWN CLOCK
      dayvec<-c(
        today(),
        today()+1,
        today()+2,
        today()+3,
        today()+4,
        today()+5,
        today()+6,
        today()+7
      )
      weekdaydf <- data.frame(day=dayvec,stringsAsFactors = F)
      weekdaydf$weekdayabr <- toupper(lubridate::wday(weekdaydf$day,label=T))
      weekdaydf$weekdayfull <- toupper(lubridate::wday(weekdaydf$day,label=T,abbr=F))
      
      
      
      
      doneday <- FALSE
      ttime <- paste0(" ",toupper(time)," ")
      ttimey <- gsub("[[:punct:]]"," ",ttime)
      noyear <- TRUE
      if(grepl(" 2022 ",ttimey)){year <- "2022";noyear <- FALSE}
      if(grepl(" 2023 ",ttimey)){year <- "2023";noyear <- FALSE}
      
      if(grepl("TODAY",ttime)){
        year <- "2022"
        month <- month(weekdaydf$day[1])
        if(nchar(month)==1){month <- paste0("0",month)}
        daynum <- day(weekdaydf$day[1])
        doneday <- TRUE
      }
      if(grepl("TOMORROW",ttime)){
        year <- "2022"
        month <- month(weekdaydf$day[2])
        if(nchar(month)==1){month <- paste0("0",month)}
        daynum <- day(weekdaydf$day[2])
        doneday <- TRUE
      }
      
      ttime <- gsub(" MONDAY "," MON ",ttime)
      ttime <- gsub(" TUESDAY "," TUE ",ttime)
      ttime <- gsub(" WEDNESDAY "," WED ",ttime)
      ttime <- gsub(" THURSDAY "," THU ",ttime)
      ttime <- gsub(" FRIDAY "," FRI ",ttime)
      ttime <- gsub(" SATURDAY "," SAT ",ttime)
      ttime <- gsub(" SUNDAY "," MON ",ttime)
      
      if(grepl(weekdaydf$weekdayabr[2],ttime)){
        year <- "2022"
        month <- month(weekdaydf$day[2])
        if(nchar(month)==1){month <- paste0("0",month)}
        daynum <- day(weekdaydf$day[2])
        doneday <- TRUE
      }
      if(grepl(weekdaydf$weekdayabr[3],ttime)){
        year <- "2022"
        month <- month(weekdaydf$day[3])
        if(nchar(month)==1){month <- paste0("0",month)}
        daynum <- day(weekdaydf$day[3])
        doneday <- TRUE
      }
      if(grepl(weekdaydf$weekdayabr[4],ttime)){
        year <- "2022"
        month <- month(weekdaydf$day[4])
        if(nchar(month)==1){month <- paste0("0",month)}
        daynum <- day(weekdaydf$day[4])
        doneday <- TRUE
      }
      if(grepl(weekdaydf$weekdayabr[5],ttime)){
        year <- "2022"
        month <- month(weekdaydf$day[5])
        if(nchar(month)==1){month <- paste0("0",month)}
        daynum <- day(weekdaydf$day[5])
        doneday <- TRUE
      }
      if(grepl(weekdaydf$weekdayabr[6],ttime)){
        year <- "2022"
        month <- month(weekdaydf$day[6])
        if(nchar(month)==1){month <- paste0("0",month)}
        daynum <- day(weekdaydf$day[6])
        doneday <- TRUE
      }
      if(grepl(weekdaydf$weekdayabr[7],ttime)){
        year <- "2022"
        month <- month(weekdaydf$day[7])
        if(nchar(month)==1){month <- paste0("0",month)}
        daynum <- day(weekdaydf$day[7])
        doneday <- TRUE
      }
      
      ttime <- gsub(" PM ","PM ",ttime)
      ttime <- gsub(" AM ","AM ",ttime)
      
      timeofday <- "NF"
      hour <- "NF"
      atime <- unlist(strsplit(trimws(rm_white(ttime))," "))
      atime <- paste0(atime," ")
      atime <- toupper(atime)
      timeloc <- grep("PM ",atime)
      if(length(timeloc)==0){
        timeloc <- grep("AM ",atime)
      }
      if(length(timeloc)>0){
        timeofday <- trimws(rm_white(atime[timeloc]))
        if(grepl(":",timeofday)){
          hour <- unlist(strsplit(timeofday,":"))[1]
          if(nchar(hour)==1){hour <- paste0("0",hour)}
          
        }else{
          hour <- rpt(timeofday)
          if(nchar(hour)==1){hour <- paste0("0",hour)}
          
        }
        atime <- atime[-timeloc]
      }
      
      if(doneday==FALSE){
        
        if(isTRUE(noyear)){
          year <- "NF"
          a2time <- paste(atime,collapse=" ")
          a2time <- paste0(" ",trimws(rm_white(gsub("[[:punct:]]"," ",atime)))," ")
          #a2time <- trimws(rpt(atime))
          if(grepl(" 2022 ",a2time)){
            year <- "2022"
            a2time <- gsub(" 2022 "," ",a2time)
          }
          if(grepl(" 2023 ",a2time)){
            year <- "2023"
            a2time <- gsub(" 2023 "," ",a2time)
          }
        }else{a2time <- atime}
        
        a2time <- paste0(" ",a2time," ")
        a2time <- paste(a2time,collapse=" ")
        
        
        gotmonth <- FALSE
        if(grepl(" JAN ",a2time)){a2time <- gsub(" JAN "," ",a2time); month <- "01";gotmonth <- T}
        if(grepl(" FEB ",a2time)){a2time <- gsub(" FEB "," ",a2time); month <- "02";gotmonth <- T}
        if(grepl(" MAR ",a2time)){a2time <- gsub(" MAR "," ",a2time); month <- "03";gotmonth <- T}
        if(grepl(" APR ",a2time)){a2time <- gsub(" APR "," ",a2time); month <- "04";gotmonth <- T}
        if(grepl(" MAY ",a2time)){a2time <- gsub(" MAY "," ",a2time); month <- "05";gotmonth <- T}
        if(grepl(" JUN ",a2time)){a2time <- gsub(" JUN "," ",a2time); month <- "06";gotmonth <- T}
        if(grepl(" JUL ",a2time)){a2time <- gsub(" JUL "," ",a2time); month <- "07";gotmonth <- T}
        if(grepl(" AUG ",a2time)){a2time <- gsub(" AUG "," ",a2time); month <- "08";gotmonth <- T}
        if(grepl(" SEP ",a2time)){a2time <- gsub(" SEP "," ",a2time); month <- "09";gotmonth <- T}
        if(grepl(" OCT ",a2time)){a2time <- gsub(" OCT "," ",a2time); month <- "10";gotmonth <- T}
        if(grepl(" NOV ",a2time)){a2time <- gsub(" NOV "," ",a2time); month <- "11";gotmonth <- T}
        if(grepl(" DEC ",a2time)){a2time <- gsub(" DEC "," ",a2time); month <- "12";gotmonth <- T}
        
        if(grepl(" JANUARY ",a2time)){a2time <- gsub(" JANUARY "," ",a2time); month <- "01";gotmonth <- T}
        if(grepl(" FEBRUARY ",a2time)){a2time <- gsub(" FEBRUARY "," ",a2time); month <- "02";gotmonth <- T}
        if(grepl(" MARCH ",a2time)){a2time <- gsub(" MARCH "," ",a2time); month <- "03";gotmonth <- T}
        if(grepl(" APRIL ",a2time)){a2time <- gsub(" APRIL "," ",a2time); month <- "04";gotmonth <- T}
        if(grepl(" MAY ",a2time)){a2time <- gsub(" MAY "," ",a2time); month <- "05";gotmonth <- T}
        if(grepl(" JUNE ",a2time)){a2time <- gsub(" JUNE "," ",a2time); month <- "06";gotmonth <- T}
        if(grepl(" JULY ",a2time)){a2time <- gsub(" JULY "," ",a2time); month <- "07";gotmonth <- T}
        if(grepl(" AUGUST ",a2time)){a2time <- gsub(" AUGUST "," ",a2time); month <- "08";gotmonth <- T}
        if(grepl(" SEPTEMBER ",a2time)){a2time <- gsub(" SEPTEMBER "," ",a2time); month <- "09";gotmonth <- T}
        if(grepl(" OCTOBER ",a2time)){a2time <- gsub(" OCTOBER "," ",a2time); month <- "10";gotmonth <- T}
        if(grepl(" NOVEMBER ",a2time)){a2time <- gsub(" NOVEMBER "," ",a2time); month <- "11";gotmonth <- T}
        if(grepl(" DECEMBER ",a2time)){a2time <- gsub(" DECEMBER "," ",a2time); month <- "12";gotmonth <- T}
        
        a2nums <- paste(a2time,collapse=" ")
        spa2nums <- unlist(strsplit(a2nums," "))
        spa2nums <- spa2nums[nchar(spa2nums)<3]
        spa2nums <- spa2nums[spa2nums!=""]
        if(length(spa2nums)>0){
          if(gotmonth==FALSE){
            month <- spa2nums[1]
            if(nchar(month)==1){month <- paste0("0",month)}
            gotmonth <- TRUE
          }
          daynum <- "NF"
          daynum <- spa2nums[length(spa2nums)]
          if(nchar(daynum)==1){daynum <- paste0("0",daynum)}
        }else{
          daynum <- "NF"
          month <- "NF"
        }
        
      }
      
    }
    
    
    #data.frame(time=timeofday, day=daynum, month=month, year=year, stringsAsFactors = F)
    if(nchar(daynum)==1){
      daynum <- paste0("0",daynum)
    }
    
    if(isTRUE(clock24)){
      hour <- hour(ymd_hm(paste0(Sys.Date()," ",timeofday)))
    }
  }
  
  #if(hour=="01")
 
  if(year=="NF"){year <- year(Sys.Date())}
  
  return(data.frame(time=timeofday, hour=hour, day=daynum, month=month, year=year, stringsAsFactors = F))

}
