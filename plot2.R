
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

# Create Plot 2

png(file = "plot2.png", height = 480, width = 480) 

plot(powersub$DateTime,powersub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
