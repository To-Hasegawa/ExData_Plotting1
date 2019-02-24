library(ggplot2)
library(dplyr)
#Load data and convert "?" to NA
data <- read.table("household_power_consumption.txt", sep=";",na.strings = "?" ,header = TRUE)

#Filter by specific period(2007/02/01-02)
data2 <- filter(data, data$Date == "1/2/2007"| data$Date =="2/2/2007")
#remove NA
data2 <- na.omit(data2)

#make graph
hist(data2$Global_active_power, col="red", xlab="Global Active Power (kikowatts)", main="Global Active Power")

#output
dev.copy(png, file="plot1.png", width=480, height=480, units="px")
dev.off()
