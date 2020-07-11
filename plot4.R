#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

#Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset
SCC_coal<-SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
NEI_coal<-NEI[NEI$SCC %in% SCC_coal$SCC, ]

#Aggregate
coal<-aggregate(Emissions ~ year + type, NEI_coal, sum)
  

#plot
library(ggplot2)
png(filename = "plot4.png",width=1920, height=1280, res=300)
qplot(year, Emissions/1000, data = coal, color = type) +
  geom_line()+
  #facet_grid(.~type)+
  ggtitle("Total of PM2.5 Coal Emmisions pollutant type and year") + 
  ylab("Total Emissions kilotons") + 
  xlab("Year")+
  theme(axis.text.x = element_text(size = 10,angle=90))
dev.off()


