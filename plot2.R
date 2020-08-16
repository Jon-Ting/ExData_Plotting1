# Read in the data and extract the subset of interest
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data$dt <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subset_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Plot graph 2
png(filename="plot2.png", width=480, height=480, units="px")
plot(x=subset_data$dt, y=subset_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
