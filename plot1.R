data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$datetime <- as.Date(strptime(x = as.character(data$Date), format = "%d/%m/%Y"))
begin <- as.Date("2007/02/01")
end <- as.Date("2007/02/02")
data.in.range <- data[data$datetime >= begin & data$datetime <= end,]

png(filename = "plot1.png")
with(data.in.range, hist(Global_active_power,
                    col = "red", 
                    main = "Global Active Power", 
                    xlab = "Global Active Power (kilowatts)", 
                    ylab = "Frequency"))
dev.off()
