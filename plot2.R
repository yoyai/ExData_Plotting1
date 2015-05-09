setwd("C:/Users/kinoe/Documents/Coursera/Exploratory data")
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
#install.packages("lubridate")
library(lubridate)

power$Date<-as.Date(power$Date, "%d/%m/%Y")

x<-subset(power, year(power$Date)=="2007")
y<-subset(x, month(x$Date)==2)
z<-subset(y, day(y$Date)<=2)

## Plot 2: Day vs. Global active power (kilowatts)
p2<-as.POSIXct(paste(z$Date, z$Time), format="%Y-%m-%d %H:%M:%S")
plot(p2, p1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()