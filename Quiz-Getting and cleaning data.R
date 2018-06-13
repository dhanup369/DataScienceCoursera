library(XML)
library(RCurl)
library(xlsx)
#------------------------------------------------------------------------------------------------
#Quiz 1(Getting and cleaning Data)
#The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
#and load the data into R. The code book, describing the variable names is here:
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
#How many properties are worth $1,000,000 or more?

if(!file.exists("coursera")){
  dir.create("coursera")
}
#fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile="./coursera/quizfile.csv",method="curl")
mydata<-read.csv("./coursera/quizfile.csv",sep=',',header=TRUE)
head(mydata)
length(mydata$VAL[!is.na(mydata$VAL)& mydata$VAL>=24]) 

#---------------------------------------------------------------------------------------------------------------------------------

#Download the Excel spreadsheet on Natural Gas Aquisition Program here:
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
#Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:dat
#What is the value of:sum(dat$Zip*dat$Ext,na.rm=T)

library(openxlsx)
library(xlsx)
xlurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(xlurl,destfile="./coursera/quiz.xlsx")
dat<-read.xlsx("./coursera/quiz.xlsx",cols=7:15,rows=18:23)
dat
sum(dat$Zip*dat$Ext,na.rm=T)

#----------------------------------------------------------------------------------------------

#Read the XML data on Baltimore restaurants from here:
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
#How many restaurants have zipcode 21231?

fileurl1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
fileurl2<-getURL(fileurl1)
doc<-xmlTreeParse(fileurl2,useInternalNodes = TRUE)
rootNode<-xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
l<-xpathSApply(rootNode,'//zipcode',xmlValue)
m<-l[l==21231]
length(m)

#---------------------------------------------------------------------------------------------

#The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
#using the fread() command load the data into an R object DT
#The following are ways to calculate the average value of the variable pwgtp15
#broken down by sex. Using the data.table package, which will deliver the fastest user time?

library(data.table)
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileurl,destfile="./coursera/quizfile.csv",method="curl")
DT<-fread("./coursera/quizfile.csv")
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])
system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
mean(DT$pwgtp15,by=DT$SEX)