
library(dplyr)
dat<-read.csv("outcome-of-care-measures.csv", colClasses = "character")

k<-select(dat,State,Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
l<-filter(k,State=="TX")
s<-l$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
s
m<-min(s,na.rm=TRUE)
m
# n<-filter(l,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure==m)

#o<-n$Hospital.Name
# o
# sort(o)
# o[1]
