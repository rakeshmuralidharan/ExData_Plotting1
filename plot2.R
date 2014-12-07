## Read data file from working directory, convert Date and Time to Date and 
## POSIXct format respectively and subsequently subset data to contain dates 
## 2007-02-01 to 2007-02-02.

data = read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                  dec = ".", na.strings = "?", stringsAsFactors = FALSE)
data$DateTime = as.POSIXct(strptime(paste(data$Date, data$Time), 
                                    format = "%d/%m/%Y %H:%M:%S"))
data$Date = as.Date(data$Date, "%d/%m/%Y")
data_sub = data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

## Create plot2.png and save as a png file with width of 480 pixels and 
## height of 480 pixels.

png(file = "plot2.png", width = 480, height = 480)
plot(data_sub$DateTime, data_sub$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

