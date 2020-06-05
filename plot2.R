
data <- read.table("household_power_consumption.txt",
header=TRUE, sep=";", na.strings=c("?"),
colClasses = c(rep('character', 2), rep('numeric', 7)))
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, format="%d/%m/%Y %H:%M:%S")
data <- data[,3:10]

png(file="plot2.png", bg="transparent", width = 480, height = 480)
plot(data$datetime, data$Global_active_power,
    type="l",
    xlab="",
    ylab="Global Active Power (kilowatts)")
dev.off()
