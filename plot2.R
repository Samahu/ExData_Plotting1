
# Load the dataset
power <- read.table(file = "household_power_consumption.txt",
                    header = T, sep=";", na.strings = "?", quote = "\"", stringsAsFactors = F)

# Re-format the dataset
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, "%d/%m/%Y")


power.subset <- subset(power, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))


png(filename = "plot2.png", width = 480, height = 480)

with(power.subset, plot(Time, Global_active_power,
                        xlab = "", ylab = "Globale Active Power (kilowatts)", type="n"))
with(power.subset, lines(Time, Global_active_power))

dev.off()