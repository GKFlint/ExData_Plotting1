setwd("~/GitHub/ExData_Plotting1")

Sys.setlocale("LC_TIME", "English")

unzip("exdata-data-household_power_consumption.zip")

fileName=("household_power_consumption.txt")

hpc <- read.table(fileName, sep=";",
                  header=TRUE,
                  stringsAsFactors=FALSE)

hpcD <- subset(hpc, 
               as.Date(hpc$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), 
                                                                 format="%Y-%m-%d"))

dates <- strptime(paste(hpcD$Date, hpcD$Time), 
                  format="%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))


plot(dates,hpcD$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")


plot(dates,hpcD$Voltage, type="l", xlab="datetime", ylab="Voltage")


plot(dates,hpcD$Sub_metering_1,type="l", xlab="", ylab = "Energy sub metering")

lines(dates,hpcD$Sub_metering_2,type="l",col="red")
lines(dates,hpcD$Sub_metering_3,type="l",col="blue")

legend("topright", lty = 1,bty = "n", col= c("black", "red", "blue"), legend = names(hpcD)[7:9])


plot(dates,hpcD$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()