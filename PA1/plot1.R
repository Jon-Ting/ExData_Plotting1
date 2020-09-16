# Read in the data and extract the subset of interest
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data$dt <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subset_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Plot graph 1
png(filename="plot1.png", width=480, height=480, units="px")
hist(subset_data$Global_active_power, breaks=13, col="red", main="Global Active Power", xlim=c(0, 6), ylim=c(0, 1200), xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
