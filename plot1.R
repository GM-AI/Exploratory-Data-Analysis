#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregate
total_by_year<-aggregate(Emissions ~ year,NEI,sum)

#plot
png(filename = "plot1.png")
barplot(total_by_year$Emissions/10^3, 
        total_by_year$year, 
        xlab="Year",  
        ylab="PM2.5 Emissions kilotons", 
        main="Total PM2.5 Emissions From All Sources in US",
        col = "#1b98e0",
        names.arg = total_by_year$year)
dev.off()

