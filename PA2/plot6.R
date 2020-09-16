# Import R package and read the RDS data sets
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extract emissions from motor vehicle sources in both cities
vehicle_source <- SCC[grep("*vehicle*|*Vehicle*", SCC$Short.Name), ]$SCC
baltimore <- NEI[which(NEI$fips == "24510"), ]
los_angeles <- NEI[which(NEI$fips == "06037"), ]
balt_motor_em <- baltimore[baltimore$SCC %in% vehicle_source, ]
la_motor_em <- los_angeles[los_angeles$SCC %in% vehicle_source, ]
agg_balt_motor <- aggregate(balt_motor_em$Emissions, list(balt_motor_em$year), mean)
agg_la_motor <- aggregate(la_motor_em$Emissions, list(la_motor_em$year), mean)

# Combine the data subsets from both cities
agg_la_motor$City <- rep("Los Angeles", nrow(agg_la_motor))
agg_balt_motor$City <- rep("Baltimore", nrow(agg_balt_motor))
both_cities <- rbind.data.frame(agg_balt_motor, agg_la_motor)
names(both_cities) = c("Year", "PM2.5 Emissions", "City")

# Plot graph 6
png("plot6.png")
ggplot(both_cities, aes(x=Year, y=`PM2.5 Emissions`, group=City)) + 
  geom_point(aes(colour=City), size=3) + 
  geom_line(aes(colour=City), size=1) + 
  ggtitle("PM2.5 Emissions from Motor Vehicle Sources")
dev.off()