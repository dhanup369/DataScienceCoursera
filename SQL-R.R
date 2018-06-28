library(RMySQL)
ucscDb<-dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result<-dbGetQuery(ucscDb,"show databases;");
dbDisconnect(ucscDb)
result

#Looking at the database hg19
hg19<-dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
allTables<-dbListTables(hg19)
length(allTables)
allTables[1:5]

#Looking at the diff fields and all the rows(*) in the table "affyU133Plus2"
dbListFields(hg19,"affyU133Plus2")
dbGetQuery(hg19,"select count(*) from affyU133Plus2")

#read from the table
affyData<-dbReadTable(hg19,"affyU133Plus2")
head(affyData)

#select a specific subset
query<-dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis<-fetch(query);
quantile(affyMis$misMatches)
affymisSmall<-fetch(query,n=10)
dim(affymisSmall)
dbClearResult(query)

dbDisconnect(hg19)