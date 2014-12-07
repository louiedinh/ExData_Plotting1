# Read the data and subset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
relevant <- subset(data, Date > "2007-01-31" & Date < "2007-02-03")

# Plot to png device
png("plot3.png", width=480, height=480)
plot(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Sub_metering_1,
	 type="n", ylab="Energy sub metering", xlab="")
lines(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Sub_metering_1, col="black")
lines(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Sub_metering_2, col="red")
lines(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Sub_metering_3, col="blue")
# Add the legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
	   lty=c(1, 1), col=c("black", "red", "blue"))
dev.off()