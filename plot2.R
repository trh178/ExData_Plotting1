data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$datetime <- as.POSIXct(strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S"))
begin <- as.POSIXct("2007/02/01 00:00:00")
end <- as.POSIXct("2007/02/02 23:59:59")
data.in.range <- data[data$datetime >= begin & data$datetime <= end,]

png(filename = "plot2.png")
with(data.in.range, plot(datetime, Global_active_power,
                         axes = FALSE,
                         type = "l",
                         col = "black",
                         xlab = "",
                         ylab = "Global Active Power (kilowatts)"))

axis(side = 1, 
     at = c(as.POSIXct("2007/02/01 00:00:00"), 
            as.POSIXct("2007/02/02 00:00:00"),
            as.POSIXct("2007/02/02 23:59:59")), 
     labels = c("Thurs", "Fri", "Sat"))
axis(side = 2, seq(0,6,2))
box()
dev.off()
