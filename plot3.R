#Of the four types of sources indicated by the type\color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases 
#in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset
balt <- subset(NEI, NEI$fips == "24510")

#Aggregate
balt_type_year<-aggregate(balt$Emissions,
                          by=list(balt$type,balt$year),
                          sum)
colnames(balt_type_year) <- c("Type", "Year", "Emissions")

#plot
library(ggplot2)
png(filename = "plot3.png",width=1920, height=1280, res=300)
qplot(Year, Emissions/1000, data = balt_type_year, color = Type) +
  geom_line()+
  facet_grid(.~Type)+
  ggtitle("Total Emissions of PM2.5 in Baltimore City By pollutant type") + 
  ylab("Total Emissions kilotons") + 
  xlab("Year")+
  theme(axis.text.x = element_text(size = 10,angle=90))
dev.off()


