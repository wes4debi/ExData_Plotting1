# This program assumes that the necessary data is stored in your working directory
# PNG files are created in your working directory

# Read the data
dfpower<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# Use only specific daes
dfpower<-subset(dfpower,as.Date(Date,"%d/%m/%Y")>="2007-02-01" & as.Date(Date,"%d/%m/%Y")<"2007-02-03")
# Create the basic histogram
hist(dfpower$Global_active_power,col="red1",main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")
# Copy to the file device
dev.copy(png,file="plot1.png",width=480,height=480)
# Close the device
dev.off()