install.packages("readtext")
library("readtext")
setwd("C:/D drive/Digital strategy/field data/coursera/exploratory data analysis/week1")
dir()
tame <- read.delim("household_power_consumption.txt",header = TRUE,sep = ";")
tame$date <-  as.Date(strptime(as.character(tame$Date), "%d/%m/%Y"))
tame <- subset(tame,tame$date >= "2007-02-01" & tame$date <= "2007-02-02")

tame$Date <- as.character(tame$date)
tame$Time <- as.character(tame$Time)
tame$date <- as.POSIXct(paste(tame$Date, tame$Time), format="%Y-%m-%d %H:%M:%S")

png("plot3.png",width = 480, height = 480)
plot(tame$date,tame$Sub_metering_1,col="black",type = "l",ylab = "Energy sub metering",xlab = "Time",main = "Time Vs Global Active Power(kilowatt)")
lines(tame$date,tame$Sub_metering_2,col="red",type = "l")
lines(tame$date,tame$Sub_metering_3,col="blue",type = "l")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),pch = 20)

dev.off()