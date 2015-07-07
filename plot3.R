# This program assumes that the necessary data is stored in your working directory
# PNG files are created in your working directory

# Read the data
dfpower<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# Subset the data
dfpower<-subset(dfpower,as.Date(Date,"%d/%m/%Y")>="2007-02-01" & as.Date(Date,"%d/%m/%Y")<"2007-02-03")
# Convert to usable dates
withdays<- strptime(paste(dfpower$Date,",", dfpower$Time),"%d/%m/%Y , %H:%M:%S")
# Add Date column back in
dfpower2<-cbind(withdays,dfpower,deparse.level=1)
# Remove any NAs
dfpower2<-dfpower2[complete.cases(dfpower2),]

#Plot each layer to get correct colors and labels
plot(dfpower2$withdays,dfpower2$Sub_metering_1,type="n",lty=1,ylab="Energy sub metering",xlab="")
points(dfpower2$withdays,dfpower2$Sub_metering_1,type="l",lty=1,col=c("black"))
points(dfpower2$withdays,dfpower2$Sub_metering_2,type="l",lty=1,col=c("red"))
points(dfpower2$withdays,dfpower2$Sub_metering_3,type="l",lty=1,col=c("blue"))
legend("topright",pch="_",col=c("black","red","blue"),text.font=.5, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Copy to file
dev.copy(png,file="plot3.png",width=480,height=480)
# Close the device
dev.off()