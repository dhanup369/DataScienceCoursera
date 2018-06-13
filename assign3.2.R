best<-function(state,outcome){
    dat<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
    S<-unique(dat$State)
    sta<-state
    if(!sta %in% S){
      stop("invalid state")}
    if(!outcome %in% c("heart failure","heart attack","pneumonia")){
      stop("invalid outcome")}
    if (outcome=="heart attack"){
      k<-select(dat,State,Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
      l<-filter(k,State==state)
      
       m<-min(l$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,na.rm=TRUE)
     
       n<-filter(l,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack==m)
     o<-n$Hospital.Name
    sort(o)
     o[1]
    }
    else if (outcome=="heart failure"){
      k<-select(dat,State,Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
      l<-filter(k,State==state)
      l1<-l$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
      l2<-as.numeric(l1)
      m<-min(l2,na.rm=TRUE)
      
      n<-filter(l,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure==m)
     
      o<-n$Hospital.Name
      o
     sort(o)
      o[1]
       }
   else{
     k<-select(dat,State,Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
     l<-filter(k,State==state)
     l1<-l$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
     l2<-as.numeric(l1)
     m<-min(l2,na.rm=TRUE)
     n<-filter(l,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia==m)
     o<-n$Hospital.Name
     sort(o)
     o[1]
    }
   
}
