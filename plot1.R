# Read the data and subset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
relevant <- subset(data, Date > "2007-01-31" & Date < "2007-02-03")

# Plot to png device
png("plot1.png", width=480, height=480)
hist(relevant$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()