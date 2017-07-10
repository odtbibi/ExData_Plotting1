#load data file and subset
temp <- tempfile()
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep=";",header=TRUE,na.strings="?")
unlink(temp)
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007" ), ]

#change format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# plot chart & save png

par(mfrow=c(2,2))

  #Chart1
plot(data$DateTime,data$Global_active_power, col="Black",type="l", xlab="",ylab="Global Active Power (kilowatts)")

  #Chart2
plot(data$DateTime,data$Voltage, col="Black",type="l", xlab="datetime",ylab="Voltage")

  #Chart3
plot(data$DateTime,data$Sub_metering_1, col="Black",type="l", xlab="",ylab="Energy Sub metering")
points(data$DateTime,data$Sub_metering_2, col="Red",type="l")
points(data$DateTime,data$Sub_metering_3, col="Blue",type="l")
legend("topright",lty=1, lwd=1,y.intersp=0.2,cex=0.6,col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_3", "Sub_metering_3"),bty="n")

#Chart4
plot(data$DateTime,data$Global_reactive_power, col="Black",type="l", xlab="datetime",ylab="Global_reactive_power")


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

