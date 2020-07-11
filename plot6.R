#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California 
#(fips == "06037"\color{red}{\verb|fips == "06037"|}fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset
SCC_vehicle<-SCC[grepl("vehicle", SCC$Short.Name, ignore.case = T),]
NEI_vehicle<-NEI[NEI$SCC %in% SCC_vehicle$SCC, ]
balt_los <- subset(NEI_vehicle, NEI_vehicle$fips %in% c("24510","06037"))
balt_los$fips[balt_los$fips=="24510"]<-"Baltimore"
balt_los$fips[balt_los$fips=="06037"]<-"Los Angeles County, California"

#Aggregate
vehicle2<-aggregate(Emissions ~ fips+year , balt_los, sum)
  

#plot
library(ggplot2)
png(filename = "plot6.png",width=1920, height=1280, res=300)
qplot(year, Emissions/1000, data = vehicle2, color=fips) +
  geom_line()+
  #facet_grid(.~type)+
  ggtitle("Emmisions from Motor Vehicle Sources \n in Baltimore and LA County, California") + 
  ylab("Total Emissions kilotons") + 
  xlab("Year")+
  theme(axis.text.x = element_text(size = 10,angle=90))
dev.off()


