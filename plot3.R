
fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "tempdata.zip")
unzip("./tempdata.zip")

selected_data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

        selected_data <- selected_data[(selected_data$Date == "1/2/2007") | (selected_data$Date == "2/2/2007"),]
        selected_data$DateTime <- strptime(paste(selected_data$Date, selected_data$Time), "%d/%m/%Y %H:%M:%S")


## Plot 3
   png(filename = "plot3.png", width = 480, height = 480, units = "px", bg="transparent")
    cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    plot(selected_data$DateTime, selected_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(selected_data$DateTime, selected_data$Sub_metering_2, type="l", col="red")
    lines(selected_data$DateTime, selected_data$Sub_metering_3, type="l", col="blue")
    legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
    dev.off()
#################################################





