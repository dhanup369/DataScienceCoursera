set.seed(13435)

#creating a dataframe
x<-data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
x<-x[sample(1:5),];x$var2[c(1,3)]=NA


#Subsetting 
x[,1]
x[,"var1"]
x[1:2,"var2"]
x[(x$"var1"<=3 & x$"var3">11),]
x[(x$"var1"<=3 | x$"var3">15),]
x[which(x$var2>8),]


#Sorting
sort(x$var1)
sort(x$var1,decreasing=TRUE)
sort(x$var2,na.last=TRUE)
x[order(x$var1),]
x[order(x$var1,x$var3),]


library(plyr)
arrange(x,var1)
arrange(x,desc(var1))


#Adding rows and columns
x$var4<-rnorm(5)
x=cbind(x,rnorm(5))
x=cbind(rnorm(5),x)
x


#Summarising Data:
fileurl="https://data.baltimorecity.gov/api/views/kewm-hd3n/rows.csv?accessType=DOWNLOAD"
download.file(fileurl,destfile="restaurants.csv",method="curl")
restdata=read.csv("restaurants.csv")
head(restdata,n=3)
tail(restdata,n=4)
summary(restdata)

str(restdata)#STructure of dataframe
quantile(restdata$councilDistrict,na.rm=TRUE)
quantile(restdata$councilDistrict,probs=c(0.5,0.75,0.9))
table(restdata$zipCode,useNA = "ifany")#one dimensional
table(restdata$councilDistrict,restdata$zipCode)  #two dimensional      

# check for missing values
sum(is.na(restdata$councilDistrict))
any(is.na(restdata$councilDistrict))
all(restdata$councilDistrict>0)
colSums(is.na(restdata))
all(colSums(is.na(restdata))==0)

table(restdata$zipCode %in% c("21211"))
table(restdata$zipCode %in% c("21211","21209"))
restdata[restdata$zipCode %in% c("21211","21209"),]

#Cross tabs:
data(UCBAdmissions)
DF=as.data.frame(UCBAdmissions)
summary(DF)
head(DF)
xt=xtabs(Freq~Gender+Admit,data=DF)
xt

#Flat Tables:
warpbreaks$replicate <-rep(1:9,len=54)
xt=xtabs(breaks~.,data=warpbreaks)
xt
ftable(xt)

#size of Data set
fakeData=rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Kb")
print(object.size(fakeData),units="b")
print(object.size(fakeData),units="Mb")

#Creating sequences
s1 <-seq(1,10,by=2)
s1
x<-c(1,3,8,25,100)
seq(along=x)
seq(x)
x[3]
x[1:4]


#Subsetting Variables
restdata$nearme=restdata$neighborhood %in% c("Woodberry")
table(restdata$nearme)

#Creating Binary Variables
restdata$zipwrong=ifelse(restdata$zipCode <0,TRUE,FALSE)
table(restdata$zipwrong,restdata$zipCode <0)

#Creating categorical variables
restdata$council=cut(restdata$councilDistrict,breaks=quantile(restdata$councilDistrict))
table(restdata$council)
table(restdata$council,restdata$councilDistrict)


#easier cutting
library(Hmisc)
restdata$council=cut2(restdata$councilDistrict,g=2)
table(restdata$council)

#creating factor variables
restdata$zcf=factor(restdata$zipCode)
restdata$zcf[1:10]
class(restdata$zcf)
table(restdata$zc)

#levels of factor variables
yesno<-sample(c("yes","no"),size=10,replace=TRUE)
table(yesno)
yesnofac<-factor(yesno,levels=c("yes","no"))
yesnofac
yesnofac<-relevel(yesnofac,ref="no")
yesnofac
as.numeric(yesnofac)

#Reshaping Data
library (reshape2)
head(mtcars)
summary(mtcars)
describe(mtcars)
#Melting data frames
mtcars$carname<-rownames(mtcars)
carMelt<-melt(mtcars,id=c("carname","gear",'cyl '),measure.vars = "mpg","hp")
head(carMelt,n=5)
tail(carMelt,n=3)

