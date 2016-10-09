## Create a line plot graph for global active power with datetime

# Load the csv data
commData<- read.csv2("household_power_consumption.txt")
commData$modifiedDate <- as.Date(commData$Date,"%d/%m/%Y")
origData <- subset(commData,commData$modifiedDate>"2007-01-31" & commData$modifiedDate<"2007-02-03")

origData$modifiedDateTime <- as.POSIXct(paste(origData$modifiedDate,origData$Time))

# Create line plot and save it as png
png("plot2.png")
origData$Global_active_power<- as.numeric(as.character(origData$Global_active_power))
plot(origData$modifiedDateTime,origData$Global_active_power,type = "n",xlab = "",ylab = "Global Active Power (kilowatts)")
lines(origData$modifiedDateTime,origData$Global_active_power)
dev.off()