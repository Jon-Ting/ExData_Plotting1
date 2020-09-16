# Read the RDS data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compute total PM2.5 emissions from all sources for each year
total_pm_emissions <- aggregate(Emissions ~ year, NEI, sum)

# Plot graph 1
png("plot1.png")
barplot(height=total_pm_emissions$Emissions, names.arg=total_pm_emissions$year, main="Total PM2.5 Emissions from All Sources", xlab="Year", ylab="PM2.5 Emissions")
dev.off()