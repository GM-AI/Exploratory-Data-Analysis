# Get data 
temp <- tempfile()
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url,temp)
unzip(temp)
unlink(temp)
