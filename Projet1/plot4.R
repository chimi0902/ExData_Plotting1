
library(lubridate)
library(data.table)


fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile="exdata_data_household_power_consumption.zip", method="curl")
unzip("exdata_data_household_power_consumption.zip")



ConData <- read.table(datafile,header = TRUE,sep=";",na.strings="?")

ConData$Date <- dmy(ConData$Date)
ConData$Time <- hms(ConData$Time)

ConData <- ConData[(ConData$Date=="2007-02-01") | (ConData$Date=="2007-02-02"),]

TimeAb <- ConData$Date+ConData$Time

png(file = "plot4.png")
par(mfrow=c(2,2))
plot(TimeAb,
     ConData$Global_active_power,
     type = "l",
     ylab = "Global active power (kilowatts)",
     xlab = "")

plot(TimeAb,
     ConData$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime", col="black")

plot(TimeAb,
     ConData$Sub_metering_1,
     type = "l",
     ylab = "Global active power (kilowatts)",
     xlab = "", col="black")
lines(TimeAb,ConData$Sub_metering_2,col="red")
lines(TimeAb,ConData$Sub_metering_3,col="blue")
legend("topright",col = c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty ="solid")
plot(TimeAb,
     ConData$Global_reactive_power,
     type = "l",
     ylab = "Global reactive power",
     xlab = "datetime", col="black")
dev.off()


