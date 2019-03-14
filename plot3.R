## Plotting submetering over time from the dataset "household_power_consumption.txt"
## containing electrical power consumption data.

# Set up data
data <- rbind(
  subset(read.delim("household_power_consumption.txt",        # set up data frame with cases for
                    sep = ";"),                               # date range: 1/2/2007 and 2/2/2007
         Date == "1/2/2007"),
  subset(read.delim("household_power_consumption.txt",
                    sep = ";"),
         Date == "2/2/2007")
)

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") # formatting date and time

subMetering1 <- with(data, as.numeric(as.character(Sub_metering_1)))   # numeric Sub_metering_1

subMetering2 <- with(data, as.numeric(as.character(Sub_metering_2)))   # numeric Sub_metering_2

subMetering3 <- with(data, as.numeric(as.character(Sub_metering_3)))   # numeric Sub_metering_3

# Plot submetering over time
png("plot3.png", width=480, height=480)

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()