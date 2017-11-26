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

#Plot2
png('Plot2.png')
with(household_power_consumption, plot(Global_active_power, type = 'l',  xaxt="n",
                                       ylab = 'Global Active Power (kilowatts)', xlab = ""))
axis(1, at = c(1,1440,2880),labels= c("Thu", "Fri", "Sat"))
dev.off()
