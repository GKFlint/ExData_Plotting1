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

png("plot2.png", 
    width = 480, height = 480)

plot(dates,
     as.numeric(hpcD$Global_active_power),
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()