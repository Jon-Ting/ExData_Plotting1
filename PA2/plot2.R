# Read the RDS data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extract total emissions by year from Baltimore subset
baltimore <- NEI[which(NEI$fips == 24510), ]
balt_tot_em <- aggregate(Emissions ~ year, baltimore, sum)

# Plot graph 2
png("plot2.png")
barplot(height=balt_tot_em$Emissions, names.arg=balt_tot_em$year, main="Total PM2.5 Emissions in the Baltimore City", xlab="Year", ylab="PM2.5 Emissions")
dev.off()
