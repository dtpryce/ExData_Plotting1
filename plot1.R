data <- read.csv("household_power_consumption.txt", sep=';', na.strings ="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2 <- data[data$Date <= "2007-02-02",]
data3 <- data2[data2$Date >= "2007-02-01",]
png("plot1.png", width = 480, height = 480, units = 'px')
hist(data3$Global_active_power, col =' red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()