
# Load the dataset
power <- read.table(file = "household_power_consumption.txt",
                    header = T, sep=";", na.strings = "?", quote = "\"", stringsAsFactors = F)

# Re-format the dataset
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, "%d/%m/%Y")


power.subset <- subset(power, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))


png(filename = "plot3.png", width = 480, height = 480)

with(power.subset, plot(Time, Sub_metering_1,
                        xlab="", ylab = "Energy sub metering", type="n"))
with(power.subset, lines(Time, Sub_metering_1, col='black'))
with(power.subset, lines(Time, Sub_metering_2, col='red'))
with(power.subset, lines(Time, Sub_metering_3, col ='blue'))
with(power.subset, legend(Time, Sub_metering_3, col ='blue'))

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), 
       lty= c(1, 1, 1))

dev.off()