# This program assumes that the necessary data is stored in your working directory
# PNG files are created in your working directory

# Read the data
dfpower<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
# Get the correct dates
dfpower<-subset(dfpower,as.Date(Date,"%d/%m/%Y")>="2007-02-01" & as.Date(Date,"%d/%m/%Y")<"2007-02-03")
# Convert to usable dates
withdays<- strptime(paste(dfpower$Date,",", dfpower$Time),"%d/%m/%Y , %H:%M:%S")
# Bind the extra column back in
dfpower2<-cbind(withdays,dfpower,deparse.level=1)
#Plot
plot(dfpower2$withdays,dfpower2$Global_active_power,type="l",lty=1,ylab="Global Active Power (kilowatts)",xlab="")
# Copy to file
dev.copy(png,file="plot2.png",width=480,height=480)
# Close the device
dev.off()