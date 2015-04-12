data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$datetime <- as.POSIXct(strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S"))
begin <- as.POSIXct("2007/02/01 00:00:00")
end <- as.POSIXct("2007/02/02 23:59:59")
data.in.range <- data[data$datetime >= begin & data$datetime <= end,]

png(filename = "plot3.png")
with(data.in.range, plot(datetime, Sub_metering_1,
                         axes = FALSE,
                         type = "l",
                         col = "black",
                         xlab = "",
                         ylab = "Energy sub metering"))
with(data.in.range, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(data.in.range, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))
box()

axis(side = 1, 
     at = c(as.POSIXct("2007/02/01 00:00:00"), 
            as.POSIXct("2007/02/02 00:00:00"),
            as.POSIXct("2007/02/02 23:59:59")), 
     labels = c("Thurs", "Fri", "Sat"))
axis(side = 2, seq(0,30,10))
dev.off()
