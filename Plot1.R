#load data file and subset
temp <- tempfile()
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep=";",header=TRUE,na.strings="?")
unlink(temp)
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007" ), ]


# plot chart & save png
hist(data$Global_active_power, col="red", cex.sub=0.8, xlab=("Global Active Power (kilowatts)"),main="Global Active Power")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

