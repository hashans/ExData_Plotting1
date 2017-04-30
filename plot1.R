consumption <- read.table(file = "household_power_consumption.txt",header = TRUE, sep = ";")

filteredData <- consumption[grepl("^(1|2)/2/2007",consumption$Date),]

remove(consumption)


filteredData$Global_active_power <- as.numeric(levels(filteredData$Global_active_power))[filteredData$Global_active_power]


hist(filteredData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")

dev.copy(png, file="plot1.png")
dev.off()