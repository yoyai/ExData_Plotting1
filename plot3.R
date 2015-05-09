setwd("C:/Users/kinoe/Documents/Coursera/Exploratory data")
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
#install.packages("lubridate")
library(lubridate)

power$Date<-as.Date(power$Date, "%d/%m/%Y")

x<-subset(power, year(power$Date)=="2007")
y<-subset(x, month(x$Date)==2)
z<-subset(y, day(y$Date)<=2)

## Plot 3: 
z$datetime<-as.POSIXct(paste(z$Date, z$Time), format="%Y-%m-%d %H:%M:%S")

plot(z$datetime, z$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(z$datetime, z$Sub_metering_2, type="l", col="red")
lines(z$datetime, z$Sub_metering_3, type="l", col="blue")

leg<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", col=c("black","red","blue"), legend=leg, lwd=2)

dev.copy(png, file = "plot3.png")
dev.off()