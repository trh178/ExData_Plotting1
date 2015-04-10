data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

par(mfrow = c(2,2))
with(data, {
    plot()
    plot()
    plot()
    plot()
    mtext("some title")
})
