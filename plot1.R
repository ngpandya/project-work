install.packages("readtext")
library("readtext")
setwd("C:/D drive/Digital strategy/field data/coursera/exploratory data analysis/week1")
dir()
tame <- read.delim("household_power_consumption.txt",header = TRUE,sep = ";")

tame$date <-  as.Date(strptime(as.character(tame$Date), "%d/%m/%Y"))
tame <- subset(tame,tame$date >= "2007-02-01" & tame$date <= "2007-02-02")

png("plot1.png",width = 480, height = 480)
hist(as.numeric(tame$Global_active_power),col = "red",xlab = "Global Active Power(Kilowatt)",main = "Global Active Power")
dev.off()