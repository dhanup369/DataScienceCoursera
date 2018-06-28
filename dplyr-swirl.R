library(dplyr)
mydf<-read.csv(path2csv,stringsAsFactors = FALSE)
dim(mydf) #Use dim() to look at the dimensions of mydf
head(mydf) #use head() to preview the data.
packageVersion("dplyr") #dplyr version
cran <- tbl_df(mydf) #'data frame tbl' or 'tbl_df'. Use the following code to create a new tbl_df called cran
rm("mydf") #remove
select(cran, ip_id, package,country)# to select only the ip_id, package, and country variables from the cran dataset.
#The select() function knows we are referring to columns of the cran dataset.
#Also, note that the columns are returned to us in the order we specified,even though ip_id is the rightmost column in the original dataset.
5:20 #Sequence 5-10
select(cran, r_arch:country)
#select(cran, r_arch:country) to select all columns starting from r_arch and ending with country.
select(cran,country:r_arch)#REverse
select(cran,-time)#to omit the time column
select(cran,-(X:size))#to omit all columns X:size using select().
#"How do I select a subset of rows?" That's where the filter() function comes in.
filter(cran, package == "swirl")#Use filter(cran, package == "swirl") to select all rows for which the package variable is equal to "swirl"
#filter() recognizes 'package' as a column of cran
#You can specify as many conditions as you want, separated by commas. For example filter(cran, r_version == "3.1.1", country == "US") 
filter(cran, r_version == "3.1.1", country == "US")
filter(cran, r_version <= "3.0.2", country == "IN")
filter(cran, country == "US" | country == "IN")#OR function
filter(cran, size > 100500, r_os == "linux-gnu")
# R represents missing values with NA and these missing values can be detected using the is.na() function
is.na(c(3, 5, NA, 10))#FALSE FALSE  TRUE FALSE
filter(cran,!is.na(r_version))#Returns all the rows that are not NA
#order the rows of a dataset according to the values of a particular variable. This is the job of arrange()
cran2<-select(cran,size:ip_id)
arrange(cran2, ip_id)#to order the ROWS of cran2 so that ip_id is in ascending order
#To do the same, but in descending order, change the second argument to desc(ip_id), where desc() stands for 'descending.
arrange(cran2,desc( ip_id))
#We can also arrange the data according to the values of multiple
# variables. For example, arrange(cran2, package, ip_id) will first arrange
# by package names (ascending alphabetically), then by ip_id. This means
#that if there are multiple rows with the same value for package, they
# will be sorted by ip_id (ascending numerically)
arrange(cran2, package, ip_id)
arrange(cran2,country,desc(r_version),ip_id)
#mutate()-to create a new variable based on the value of one or more variables already in a dataset.
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)
#summarize(), collapses the dataset to a single row
summarize(cran, avg_bytes = mean(size))
#summarize() is most useful when
#working with data that has been grouped by the values of a particular variable.
