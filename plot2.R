consumption <- read.table(file = "household_power_consumption.txt",header = TRUE, sep = ";")

filteredData <- consumption[grepl("^(1|2)/2/2007",consumption$Date),]

remove(consumption)

filteredData$Global_active_power <- as.numeric(levels(filteredData$Global_active_power))[filteredData$Global_active_power]

filteredData$DateTime <- strptime(paste(filteredData$Date,filteredData$Time), format = "%d/%m/%Y %H:%M:%S")

plot(filteredData$DateTime,filteredData$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.copy(png, file="plot2.png")
dev.off()