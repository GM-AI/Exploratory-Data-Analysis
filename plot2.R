#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510"\color{red}{\verb|fips == "24510"|}fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset
balt <- subset(NEI, NEI$fips == "24510")

#Aggregate
total_by_year<-aggregate(Emissions ~ year,balt,sum)

#plot
png(filename = "plot2.png")
barplot(total_by_year$Emissions/10^3, 
        total_by_year$year, 
        xlab="Year",  
        ylab="PM2.5 Emissions kilotons", 
        main="Total PM2.5 Emissions From All Sources in Baltimore City, Maryland",
        col = "#E0631B",
        names.arg = total_by_year$year)
dev.off()

