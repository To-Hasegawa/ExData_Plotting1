library(ggplot2)
library(dplyr)
#Load data and convert "?" to NA
data <- read.table("household_power_consumption.txt", sep=";",na.strings = "?" ,header = TRUE)

#Filter by specific period(2007/02/01-02)
data2 <- filter(data, data$Date == "1/2/2007"| data$Date =="2/2/2007")
#remove NA
data2 <- na.omit(data2)

#add date_time column
data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
data2 <- transform(data2, data_time=as.POSIXct(paste(Date, Time), sep=" ", format="%Y-%m-%d %H:%M:%S"))

#make graph
plot(data2$data_time, data2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kikowatts)")

#output
dev.copy(png, file="plot2.png", width=480, height=480, units="px")
dev.off()
