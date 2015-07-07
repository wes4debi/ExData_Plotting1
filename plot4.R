# This program assumes that the necessary data is stored in your working directory
# PNG files are created in your working directory

#Read the data
dfpower<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#Subset the data
dfpower<-subset(dfpower,as.Date(Date,"%d/%m/%Y")>="2007-02-01" & as.Date(Date,"%d/%m/%Y")<"2007-02-03")
# Convert to date format
withdays<- strptime(paste(dfpower$Date,",", dfpower$Time),"%d/%m/%Y , %H:%M:%S")
# Add date column back in
dfpower2<-cbind(withdays,dfpower,deparse.level=1)

# Set margins and multiple graph settings
par(mar=c(4,4,1,1))
par(mfrow=c(2,2))

#plot the 4 graphs

plot(dfpower2$withdays,dfpower2$Global_active_power,type="l",lty=1,ylab="Global Active Power",xlab="")
plot(dfpower2$withdays,dfpower2$Voltage,type="l",lty=1,ylab="Voltage",xlab="datetime")
plot(dfpower2$withdays,dfpower2$Sub_metering_1,type="n",lty=1,ylab="Energy sub metering",xlab="")
points(dfpower2$withdays,dfpower2$Sub_metering_1,type="l",lty=1,col=c("black"))
points(dfpower2$withdays,dfpower2$Sub_metering_2,type="l",lty=1,col=c("red"))
points(dfpower2$withdays,dfpower2$Sub_metering_3,type="l",lty=1,col=c("blue"))
legend("topright",pch="____",col=c("black","red","blue"),bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(dfpower2$withdays,dfpower2$Global_reactive_power,type="l",lty=1,ylab="Global_reactive_power",xlab="datetime")

# Save image to file
dev.copy(png,file="plot4.png",width=480,height=480)
# Close the device
dev.off()