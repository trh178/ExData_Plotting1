data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")



with(data, hist(Global_active_power,
                axes = FALSE,
                col = "red", 
                main = "Global Active Power", 
                xlab = "Global Active Power (kilowatts)", 
                ylab = "Frequency"))
axis(side = 1, at = seq(0,6,2), labels = seq(0,6,2))
