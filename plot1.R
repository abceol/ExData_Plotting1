
data <- read.table("household_power_consumption.txt",
header=TRUE, sep=";", na.strings=c("?"),
colClasses = c(rep('character', 2), rep('numeric', 7)))
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

png(file="plot1.png", bg="transparent", width = 480, height = 480)
hist(data$Global_active_power,
    col="red",
    main="Global Active Power",
    xlab="Global Active Power (kilowatts)")
dev.off()
