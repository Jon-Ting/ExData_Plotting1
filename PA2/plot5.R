# Import R package
library(ggplot2)

# Read the RDS data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extract emission from motor vehicle sources in Baltimore
vehicle_source <- SCC[grep("*vehicle*|*Vehicle*", SCC$Short.Name), ]$SCC
baltimore <- NEI[which(NEI$fips == 24510), ]
balt_motor_em <- baltimore[baltimore$SCC %in% vehicle_source, ]
agg_balt_motor <- aggregate(balt_motor_em$Emissions, list(balt_motor_em$year), mean)
names(agg_balt_motor) <- c("Year", "PM2.5 Emissions")

# Plot graph 5
png("plot5.png")
ggplot(agg_balt_motor, aes(x=Year, y=`PM2.5 Emissions`, group=1)) + 
  geom_point(size=3) + 
  geom_line(size=1.5) + 
  ggtitle("PM2.5 Emissions from Motor Vehicle Sources")
dev.off()