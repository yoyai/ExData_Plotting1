setwd("C:/Users/kinoe/Documents/Coursera/Exploratory data")
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
#install.packages("lubridate")
library(lubridate)

power$Date<-as.Date(power$Date, "%d/%m/%Y")

x<-subset(power, year(power$Date)=="2007")
y<-subset(x, month(x$Date)==2)
z<-subset(y, day(y$Date)<=2)

## Plot 1: global active power vs. frequency
p1<-as.numeric(z$Global_active_power)
z$Global_active_power
hist(p1, col="red", breaks=16, main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()