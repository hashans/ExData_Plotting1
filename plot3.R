consumption <- read.table(file = "household_power_consumption.txt",header = TRUE, sep = ";")

filteredData <- consumption[grepl("^(1|2)/2/2007",consumption$Date),]

remove(consumption)

filteredData$Sub_metering_1 <- as.numeric(levels(filteredData$Sub_metering_1))[filteredData$Sub_metering_1]
filteredData$Sub_metering_2 <- as.numeric(levels(filteredData$Sub_metering_2))[filteredData$Sub_metering_2]

filteredData$DateTime <- strptime(paste(filteredData$Date,filteredData$Time), format = "%d/%m/%Y %H:%M:%S")

plot(filteredData$DateTime,filteredData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(filteredData$DateTime,filteredData$Sub_metering_2, col="red")
lines(filteredData$DateTime,filteredData$Sub_metering_3,  col="blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lwd = 1)

dev.copy(png, file="plot3.png")
dev.off()