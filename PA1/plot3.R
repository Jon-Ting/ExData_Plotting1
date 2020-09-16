# Read in the data and extract the subset of interest
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data$dt <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subset_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Plot graph 3
png(filename="plot3.png", width=480, height=480, units="px")
plot(x=subset_data$dt, y=subset_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(x=subset_data$dt, y=subset_data$Sub_metering_2, type="l", col="red")
points(x=subset_data$dt, y=subset_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()
