## Create a line plot multivariate graph for sub_metering  with datetime

# Load the csv data
commData<- read.csv2("household_power_consumption.txt")
commData$modifiedDate <- as.Date(commData$Date,"%d/%m/%Y")
origData <- subset(commData,commData$modifiedDate>"2007-01-31" & commData$modifiedDate<"2007-02-03")
origData$modifiedDateTime <- as.POSIXct(paste(origData$modifiedDate,origData$Time))

# Create line plot and save it as png

png("plot3.png")
origData$Sub_metering_1<- as.numeric(as.character(origData$Sub_metering_1))
origData$Sub_metering_2<- as.numeric(as.character(origData$Sub_metering_2))
origData$Sub_metering_3<- as.numeric(as.character(origData$Sub_metering_3))
plot(origData$modifiedDateTime,origData$Sub_metering_1,type = "n",xlab = "",ylab = "Energy sub metering")
lines(origData$modifiedDateTime,origData$Sub_metering_1)
lines(origData$modifiedDateTime,origData$Sub_metering_2,col="Red")
lines(origData$modifiedDateTime,origData$Sub_metering_3,col="Blue")

# Create legend

legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty = c(1,1,1),lwd = c(2.5,2.5,2.5),col = c("Black","Red","Blue"))
dev.off()