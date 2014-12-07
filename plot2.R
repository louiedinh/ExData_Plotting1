# Read the data and subset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
relevant <- subset(data, Date > "2007-01-31" & Date < "2007-02-03")

# Plot to png device
png("plot2.png", width=480, height=480)
plot(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Global_active_power,
	 type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(as.POSIXct(paste(relevant$Date, relevant$Time)), relevant$Global_active_power)
dev.off()