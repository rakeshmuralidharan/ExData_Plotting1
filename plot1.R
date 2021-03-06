## Read data file from working directory, convert Date and Time to Date and 
## POSIXct format respectively and subsequently subset data to contain dates 
## 2007-02-01 to 2007-02-02.

data = read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                  dec = ".", na.strings = "?", stringsAsFactors = FALSE)
data$DateTime = as.POSIXct(strptime(paste(data$Date, data$Time), 
                                    format = "%d/%m/%Y %H:%M:%S"))
data$Date = as.Date(data$Date, "%d/%m/%Y")
data_sub = data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

## Create plot1.png and save as a png file with width of 480 pixels and 
## height of 480 pixels.

png(file = "plot1.png", width = 480, height = 480)
hist(data_sub$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()



