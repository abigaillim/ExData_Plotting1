## Creating a histogram for Global Active Power from the dataset "household_power_consumption.txt"
## containing electrical power consumption data.

# Set up data
data <- rbind(
          subset(read.delim("household_power_consumption.txt",        # set up data frame with cases for
                            sep = ";"),                              # date range: 1/2/2007 and 2/2/2007
                            Date == "1/2/2007"),
          subset(read.delim("household_power_consumption.txt",
                            sep = ";"),
                            Date == "2/2/2007")
        )

GlobalActivePower <- with(data, as.numeric(as.character(Global_active_power)))   # numeric Global_active_power

# Plot histogram
png("plot1.png", width = 480, height = 480)
hist(GlobalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()