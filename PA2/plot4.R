# Import R package and read the RDS data sets
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extract emission from coal-combustion related sources across US
coal_source <- SCC[grep("*coal*|*Coal*", SCC$Short.Name), ]$SCC
coal_data <- NEI[NEI$SCC %in% coal_source, ]
agg_coal <- aggregate(coal_data, list(coal_data$year), mean)
agg_coal <- agg_coal[1:6]
names(agg_coal)[1] <- c("Year")

# Plot graph 4
png("plot4.png")
ggplot(data=agg_coal, mapping=aes(x=Year, y=Emissions, group=1)) + 
  geom_point(size=3) + 
  geom_line(size=1) + 
  ggtitle("PM2.5 Emissions from Coal Combustion-Related Sources")
dev.off()