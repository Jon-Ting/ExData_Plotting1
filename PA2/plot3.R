# Import R package and read the RDS data sets
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Group data by source type and year in Baltimore subset
baltimore <- NEI[which(NEI$fips == 24510), ]
agg_balt_NEI <- aggregate(x=baltimore$Emissions, by=list(baltimore$type, baltimore$year), FUN=mean)
names(agg_balt_NEI) <- c("Type", "Year", "PM2.5 Emissions")
  
# Plot graph 3
png("plot3.png")
ggplot(data=agg_balt_NEI, mapping=aes(x=Year, y=`PM2.5 Emissions`)) + 
  geom_point(mapping=aes(colour=Type), size=3) + 
  geom_line(mapping=aes(group=Type, colour=Type), size=1.5) + 
  ggtitle("PM2.5 Emissions in Baltimore by Source Types")
dev.off()
