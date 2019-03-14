## Plotting Global Active Power over time from the dataset "household_power_consumption.txt"
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

GlobalActivePower <- with(data, as.numeric(as.character(Global_active_power)))   # numeric Global_active_power
                
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") # formatting date and time


# Plot active power consumption over time
png("plot2.png", width = 480, height = 480)
plot(datetime, GlobalActivePower,
            type = "l",
            xlab = "", 
            ylab = "Global Active Power (kilowatts)"
      )
dev.off()