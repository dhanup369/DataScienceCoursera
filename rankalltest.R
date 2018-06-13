rankall <- function(outcome, num ) {
  dat<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
  S<-dat$State
  
  
  if(!outcome %in% c("heart failure","heart attack","pneumonia")){
    stop("invalid outcome")}
  if (outcome=="heart attack")
  {
    k<-select(dat,State,Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    l1<-filter(k,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack!="Not Available")
     l2<-l1[order(l1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,l1$Hospital.Name),]
     l5<-l2[order(l2$State),]
    }
  if (outcome=="heart failure")
  {
    k<-select(dat,State,Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    l1<-filter(k,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure!="Not Available")
    l2<-l1[order(l1$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,l1$Hospital.Name),]
    l5<-l2[order(l2$State),]
  }
  
  if (outcome=="pneumonia")
  {
    k<-select(dat,State,Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    l1<-filter(k,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia!="Not Available")
    l2<-l1[order(l1$State,l1$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia,l1$Hospital.Name),]
    l5<-l2[order(l2$State),]
  }
  if (num=='best'){
    l3<-head(l2,1)
    j<-l3$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    i<-as.numeric(j)
    l4<-filter(l2,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack==i)
    
  }
  
  else if (num=='worst'){
    l3<-tail(l5,1)
    j<-l3$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    i<-as.numeric(j)
    l4<-filter(l2,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia==i)
    
    
  }
  else
  {
    l3<-l5[num,]
    j<-l3$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    i<-as.numeric(j)
    l4<-filter(l5,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack==i)
    
  }
  
l5
}
tail(rankall("pneumonia", 'worst'),3)