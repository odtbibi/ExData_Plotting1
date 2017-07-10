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

plot(data$DateTime,data$Global_active_power, col="Black",type="l", xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

