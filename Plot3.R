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

plot(data$DateTime,data$Sub_metering_1, col="Black",type="l", xlab="",ylab="Energy Sub metering")
points(data$DateTime,data$Sub_metering_2, col="Red",type="l")
points(data$DateTime,data$Sub_metering_3, col="Blue",type="l")
legend("topright",lty=1, lwd=1,y.intersp=0.4,cex=0.8,col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_3", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

