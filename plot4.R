data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$datetime <- as.POSIXct(strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S"))
begin <- as.POSIXct("2007/02/01 00:00:00")
end <- as.POSIXct("2007/02/02 23:59:59")
data.in.range <- data[data$datetime >= begin & data$datetime <= end,]

png(filename = "plot4.png")
par(mfrow = c(2,2))
with(data.in.range, {
    plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    plot(datetime, Voltage, type = "l")
    plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(datetime, Sub_metering_2, type = "l", col = "red")
    lines(datetime, Sub_metering_3, type = "l", col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n")
    plot(datetime, Global_reactive_power, type = "l")
})
dev.off()
