# Read the data and subset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
relevant <- subset(data, Date > "2007-01-31" & Date < "2007-02-03")

# Plot to png device
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# plot 1
plot(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Global_active_power, type="n", ylab="Global Active Power")
lines(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Global_active_power)

# plot 2
plot(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Voltage)

# plot 3
plot(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Sub_metering_1,
	 type="n", ylab="Energy sub metering", xlab="")
lines(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Sub_metering_1, col="black")
lines(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Sub_metering_2, col="red")
lines(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Sub_metering_3, col="blue")
# Add the legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
	   lty=c(1, 1), col=c("black", "red", "blue"), bty="n")

#plot 4
plot(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Global_reactive_power, type="n",
			    ylab="Global_reactive_power", xlab="datetime")
lines(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Global_reactive_power)

dev.off()