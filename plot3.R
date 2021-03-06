## Read data file from working directory, convert Date and Time to Date and 
## POSIXct format respectively and subsequently subset data to contain dates 
## 2007-02-01 to 2007-02-02.

data = read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                  dec = ".", na.strings = "?", stringsAsFactors = FALSE)
data$DateTime = as.POSIXct(strptime(paste(data$Date, data$Time), 
                                    format = "%d/%m/%Y %H:%M:%S"))
data$Date = as.Date(data$Date, "%d/%m/%Y")
data_sub = data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

## Create plot3.png and save as a png file with width of 480 pixels and 
## height of 480 pixels.

png(file = "plot3.png", width = 480, height = 480)
plot(data_sub$DateTime, data_sub$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(data_sub$DateTime, data_sub$Sub_metering_2, col = "red")
lines(data_sub$DateTime, data_sub$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = 
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()