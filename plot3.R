## Getting full dataset
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##plotting graph
with(data, {
plot(Sub_metering_1~Datetime,type="l",xlab="",ylab="Energy sub metering")
 lines(Sub_metering_2~Datetime,col='Red')
 lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright",lty=1, lwd=2, col = c("black", "red","blue"), legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

