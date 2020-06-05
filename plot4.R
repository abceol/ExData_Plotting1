
data <- read.table("household_power_consumption.txt",
header=TRUE, sep=";", na.strings=c("?"),
colClasses = c(rep('character', 2), rep('numeric', 7)))
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, format="%d/%m/%Y %H:%M:%S")
data <- data[,3:10]

png(file="plot4.png", bg="transparent", width = 480, height = 480)
par(mfrow = c(2, 2))    ## better: mar = c(4, 4, 2, 2)

## top left
plot(data$datetime, data$Global_active_power,
    type="l",
    xlab="",
    ylab="Global Active Power")

## top right
plot(data$datetime, data$Voltage,
    type="l",
    xlab="datetime",
    ylab="Voltage")

## bottom left
plot(data$datetime, data$Sub_metering_1,
    type="l",
    xlab="",
    ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "blue", "red"),
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lty=1, lwd=1)

## bottom right
plot(data$datetime, data$Global_reactive_power,
    type="l",
    xlab="datetime",
    ylab="Global_reactive_power")
dev.off()
