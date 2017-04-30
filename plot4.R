consumption <- read.table(file = "household_power_consumption.txt",header = TRUE, sep = ";")

filteredData <- consumption[grepl("^(1|2)/2/2007",consumption$Date),]

remove(consumption)

filteredData$Global_active_power <- as.numeric(levels(filteredData$Global_active_power))[filteredData$Global_active_power]

filteredData$Sub_metering_1 <- as.numeric(levels(filteredData$Sub_metering_1))[filteredData$Sub_metering_1]
filteredData$Sub_metering_2 <- as.numeric(levels(filteredData$Sub_metering_2))[filteredData$Sub_metering_2]

filteredData$DateTime <- strptime(paste(filteredData$Date,filteredData$Time), format = "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

plot(filteredData$DateTime,filteredData$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

plot(filteredData$DateTime,filteredData$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(filteredData$DateTime,filteredData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(filteredData$DateTime,filteredData$Sub_metering_2, col="red")
lines(filteredData$DateTime,filteredData$Sub_metering_3,  col="blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lwd = 1)

plot(filteredData$DateTime,filteredData$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.copy(png, file="plot4.png")
dev.off()