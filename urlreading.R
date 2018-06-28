#Reading from the web

con=url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode=readLines(con)
close(con)
htmlCode

library(XML)
library(XLConnect)
url<-"http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html<-htmlTreeParse(url,useInternalNodes = TRUE)
xpathSApply(html,"//title",xmlValue)