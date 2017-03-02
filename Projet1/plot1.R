
library(lubridate)
library(data.table)

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile="exdata_data_household_power_consumption.zip", method="curl")
unzip("exdata_data_household_power_consumption.zip")


datafile <- "household_power_consumption.txt"

ConData <- read.table(datafile,header = TRUE,sep=";",na.strings="?")

ConData$Date <- dmy(ConData$Date)
ConData$Time <- hms(ConData$Time)


ConData <- ConData[(ConData$Date=="2007-02-01") | (ConData$Date=="2007-02-02"),]

TimeAb <- ConData$Date+ConData$Time

png(file = "plot11.png")
hist(ConData$Global_active_power, col = "red",
     xlab = "Global active power (kilowatts)", ylab = "Frequency",
     main = "Global active power")
dev.off()

