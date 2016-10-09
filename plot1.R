## Create a barplot graph for global active power with frequency

# Load the csv data
commData<- read.csv2("household_power_consumption.txt")

commData$modifiedDate <- as.Date(commData$Date,"%d/%m/%Y")

# Create subset of data only first 2 days of february 2007
origData <- subset(commData,commData$modifiedDate>"2007-01-31" & commData$modifiedDate<"2007-02-03")
origData$Global_active_power<- as.numeric(as.character(origData$Global_active_power))

# Create frequencies of global active power
globalpower <- table(cut(origData$Global_active_power,seq(0,10,by=0.5),labels = seq(0,9.5,by=0.5)))

# Create bar plot and save it as png
png("plot1.png")
barplot(globalpower,space = 0,col="Red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",main = "Global Active Power")
dev.off()

