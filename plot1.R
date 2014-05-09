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

png("plot1.png", 
    width = 480, height = 480)

hist(as.numeric(hpcD$Global_active_power),
     col="red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()