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

#Plot 1
png('Plot1.png')
with(household_power_consumption, hist(Global_active_power, col = 'red', main = "Global Active Power"
                                       , xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))
dev.off()
