data <- read.csv("household_power_consumption.txt", sep=';', na.strings ="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2 <- data[data$Date <= "2007-02-02",]
data3 <- data2[data2$Date >= "2007-02-01",]
png("plot2.png", width = 480, height = 480, units = 'px')
myts <- ts(data3$Global_active_power,frequency=1)
plot(myts, xlab="",ylab='Global Active Power (kilowatts)', axes=FALSE)
ticks = c(0, 1440, 2880)
box("plot")
axis(1, at=c(0, 1440, 2880), labels=c("Thu","Fri","Sat"))
axis(side = 2)
dev.off()