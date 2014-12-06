
## Unzip files

unzip('household_power_consumption.zip')

## Read the file into a dataframe

power <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?", stringsAsFactors = FALSE)

## Subset by creating a dataframe which only contains the dates 2007-02-01 and 2007-02-02

powersub <- subset(power, power$Date %in% c("1/2/2007","2/2/2007"))

## Create a Date Time variable
powersub$DateTime <- paste(powersub$Date, powersub$Time)

## Convert to POSIX Date
powersub$DateTime <- strptime(powersub$DateTime, format="%d/%m/%Y %H:%M:%S")

# Create Plot 3
png(file = "plot3.png", height = 480, width = 480) 

plot(powersub$DateTime, powersub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(powersub$DateTime, powersub$Sub_metering_2, type = "l", col = "red")
lines(powersub$DateTime, powersub$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
