
library(XML)
library(RCurl)
library(xlsx)
if(!file.exists("coursera")){
  dir.create("coursera")
}

#Reading CSV,XL,XML files:
fileurl<-"https://data.baltimorecity.gov/api/views/2weq-566u/rows.csv?accessType=DOWNLOAD"
download.file(fileurl,destfile="./coursera/cameras.csv",method="curl")
mydata<-read.table("./coursera/cameras.csv",sep=',',header=TRUE)
head(mydata)
mydata1<-read.csv("./coursera/cameras.csv")
head(mydata1)
xlurl<-"https://data.baltimorecity.gov/api/views/2weq-566u/rows.csv?accessType=DOWNLOAD&bom=true&format=true"
fileurl1<-getURL(xlurl)
download.file(fileurl1,destfile="./coursera/cameras.xlsx",method="curl")
list.files("coursera")



library(openxlsx)
library(xlsx)
mydata2<-read.xlsx("./coursera/cameras.xlsx")
head(mydata2)
mydata3<-read_xlsx("./coursera/example.xlsx")
mydata3
fileurl1<-"https://www.w3schools.com/xml/simple.xml"
fileurl2<-getURL(fileurl1)
doc<-xmlTreeParse(fileurl2,useInternalNodes = TRUE)
rootNode<-xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[1:3]
rootNode[[1]][[1]]
rootNode[[1]][[3]]
xmlSApply(rootNode,xmlValue)
xpathSApply(rootNode,'//name',xmlValue)
xpathSApply(rootNode,'//price',xmlValue)
url1<-"http://www.espn.com/nfl/team/_/name/bal/baltimore-ravens"
url2<-getURL(url1)
doc1<-htmlParse(url2,useInternalNodes = TRUE)
root1<-xmlRoot(doc1)
xpathSApply(root1,"//li[@class='team-name']",xmlValue)
xpathSApply(root1,"//li[@class='score']",xmlValue)
#data <- htmlParse("http://www.espn.com/nfl/team/_/name/bal/baltimore-ravens")
#readHTMLTable(data)
library(jsonlite)
jsonData<-fromJSON("https://api.github.com/users/dhanup369/repos")
jsonData$name
names(jsonData)
names(jsonData$owner)
names(jsonData$owner$login)
myJson<-toJSON(mtcars,pretty=TRUE)
cat(myJson)
mt<-fromJSON(myJson)
head(mt)

library(data.table) 
DF=data.frame(x=rnorm(9),y=rep(c("a","b","c"),3),z=rnorm(9))
DF
DF=data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
DF
DF=data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
DF
tables()
DF[2,]
DF[DF$y=="b",]
DF[c(1,2),]#first two rows
DF[,c(1,2)]#First two columns
DF[2,2]
k={print(5);10}
DF[,w:=z+3]
DF
DF1<-DF
DF[,e:=1]
DF1
DF
DF[,m:={tmp<-(x+z);log2(tmp+5)}]
DF[,a:=x>0]
DF
DF[,b:=mean(x+z),by=y]
DF
set.seed(123)
tab<-data.table(x=sample(letters[1:3],1000,TRUE))
tab[,.N,by=x]
DT<-data.table(x=rep(c("a","b","c"),each=100),y=rnorm(300))
setkey(DT,x)
DT['a']
dt1<-data.table(x=c('a','a','b','dt1'),y=1:4)
dt2<-data.table(x=c('a','b','dt2'),y=5:7)
setkey(dt1,x)
setkey(dt2,x)
merge(dt1,dt2)