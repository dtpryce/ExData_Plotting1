data <- read.csv("household_power_consumption.txt", sep=';', na.strings ="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data2 <- data[data$Date <= "2007-02-02",]
data3 <- data2[data2$Date >= "2007-02-01",]
png("plot4.png", width = 480, height = 480, units = 'px')

myts <- ts(data3$Global_active_power,frequency=1)
myts2 <- ts(data3$Sub_metering_1, frequency=1)
myts3 <- ts(data3$Sub_metering_2, frequency=1)
myts4 <- ts(data3$Sub_metering_3, frequency=1)
ts5 <- ts(data3$Voltage, frequency=1) 
ts6 <- ts(data3$Global_reactive_power, frequency=1)


par(mfrow=c(2,2))
plot(myts, xlab="",ylab='Global Active Power', axes=FALSE)
ticks = c(0, 1440, 2880)
box("plot")
axis(1, at=c(0, 1440, 2880), labels=c("Thu","Fri","Sat"))
axis(side = 2)

plot(ts5,xlab='datetime', ylab='Voltage', axes=FALSE)
ticks = c(0, 1440, 2880)
box("plot")
axis(1, at=c(0, 1440, 2880), labels=c("Thu","Fri","Sat"))
axis(side = 2)

plot(myts2, ylim=range(c(myts2,myts3,myts4)),axes=FALSE,xlab="",ylab='Energy sub metering')
par(new=TRUE)
plot(myts3, ylim=range(c(myts2,myts3,myts4)),axes=FALSE, xlab="",ylab='',col='red')
par(new=TRUE)
plot(myts4, ylim=range(c(myts2,myts3,myts4)),axes=FALSE, xlab="",ylab='',col='blue')
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"),bty="n")
ticks = c(0, 1440, 2880)
box("plot")
axis(1, at=c(0, 1440, 2880), labels=c("Thu","Fri","Sat"))
axis(side = 2)

plot(ts6, xlab='datetime',ylab='Global_reactive_power', axes=FALSE)
ticks = c(0, 1440, 2880)
box("plot")
axis(1, at=c(0, 1440, 2880), labels=c("Thu","Fri","Sat"))
axis(side = 2)
dev.off()