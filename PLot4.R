library(readr)
library(lubridate)

#import data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"data.csv")
household_power_consumption <- read.csv(unzip("data.csv"), na = c("?"), stringsAsFactors = F, sep = ";")

#convert Date to date object
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

#filter relevant dates
household_power_consumption <- subset(household_power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

#convert Time to time object
household_power_consumption$Time <- strptime(household_power_consumption$Time, format = "%H:%M:%S")


#Plot4
png('Plot4.png')
par(mfrow = c(2, 2), cex.axis = 1, cex.lab = 1)

#Plot4-1
with(household_power_consumption, plot(Global_active_power, type = 'l',  xaxt="n",
                                       ylab = 'Global Active Power (kilowatts)', xlab = ""))
axis(1, at = c(1,1440,2880),labels= c("Thu", "Fri", "Sat"))

#Plot4-2
with(household_power_consumption, plot(Voltage, type = 'l',  xaxt="n",
                                       ylab = 'Voltage', xlab = "datetime"))
axis(1, at = c(1,1440,2880),labels= c("Thu", "Fri", "Sat"))

#Plot4-3
with(household_power_consumption, plot(Sub_metering_1, type = 'l',  xaxt="n",
                                       ylab = 'Energy sub metering', xlab = ""))
lines(household_power_consumption$Sub_metering_2, type = 'l', col = 'red')
lines(household_power_consumption$Sub_metering_3, type = 'l', col = 'blue')
axis(1, at = c(1,1440,2880),labels= c("Thu", "Fri", "Sat"))
legend('topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , col = c('black', 'red', 'blue'), lwd = 1, cex = .5, bty = "n")

#Plot4-4
with(household_power_consumption, plot(Global_reactive_power, type = 'l',  xaxt="n",
                                       xlab = 'datetime', ylab = "Global_reactive_power"))
axis(1, at = c(1,1440,2880),labels= c("Thu", "Fri", "Sat"))
dev.off()
