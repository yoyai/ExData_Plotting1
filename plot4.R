setwd("C:/Users/kinoe/Documents/Coursera/Exploratory data")
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
#install.packages("lubridate")
library(lubridate)

power$Date<-as.Date(power$Date, "%d/%m/%Y")

x<-subset(power, year(power$Date)=="2007")
y<-subset(x, month(x$Date)==2)
z<-subset(y, day(y$Date)<=2)

## Plot 4: 
z$datetime<-as.POSIXct(paste(z$Date, z$Time), format="%Y-%m-%d %H:%M:%S")
par(mfrow=c(2,2))
b<-seq(0.1, 0.5, by=0.1)

with(z, {
  plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(datetime, Voltage, type="l")
  plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, type="l", col="red")
  lines(datetime, Sub_metering_3, type="l", col="blue")
  plot(datetime, Global_reactive_power, axes=T, type="l", ylim=c(0, 0.5))
  axis(2, at=b, labels=b)
})

dev.copy(png, file = "plot4.png")
dev.off()