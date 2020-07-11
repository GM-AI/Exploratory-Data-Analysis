#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset
SCC_vehicle<-SCC[grepl("vehicle", SCC$Short.Name, ignore.case = T),]
NEI_vehicle<-NEI[NEI$SCC %in% SCC_vehicle$SCC, ]
balt <- subset(NEI_vehicle, NEI_vehicle$fips == "24510")

#Aggregate
vehicle<-aggregate(Emissions ~ year , balt, sum)
  

#plot
library(ggplot2)
png(filename = "plot5.png",width=1920, height=1280, res=300)
qplot(year, Emissions/1000, data = vehicle) +
  geom_line()+
  #facet_grid(.~type)+
  ggtitle("Total of PM2.5 Motor  Vehicle Sources pollutant type and year") + 
  ylab("Total Emissions kilotons") + 
  xlab("Year")+
  theme(axis.text.x = element_text(size = 10,angle=90))
dev.off()


