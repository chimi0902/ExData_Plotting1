
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

png(file = "plot3.png")
plot(TimeAb,ConData$Sub_metering_1,
     type = "l",
     ylab = "Global active power (kilowatts)",
     xlab = "", col="black")
lines(TimeAb,ConData$Sub_metering_2,col="red")
lines(TimeAb,ConData$Sub_metering_3,col="blue")
legend("topright",col = c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty ="solid")
dev.off()
 

