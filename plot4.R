## Plotting 4 plots - global active power over time, voltage
## over time, submetering over time, and global reactive power
## over time from the dataset "household_power_consumption.txt"
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

GlobalActivePower <- with(data, as.numeric(as.character(Global_active_power)))   # numeric Global_active_power

GlobalReactivePower <- with(data, as.numeric(as.character(Global_reactive_power)))   # numeric Global_reactive_power

voltage <- with(data, as.numeric(as.character(Voltage)))   # numeric Voltage

subMetering1 <- with(data, as.numeric(as.character(Sub_metering_1)))   # numeric Sub_metering_1

subMetering2 <- with(data, as.numeric(as.character(Sub_metering_2)))   # numeric Sub_metering_2

subMetering3 <- with(data, as.numeric(as.character(Sub_metering_3)))   # numeric Sub_metering_3

# Plotting time!
png("plot4.png", width=480, height=480)       # setting up layout of plots
par(mfrow = c(2, 2)) 

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()