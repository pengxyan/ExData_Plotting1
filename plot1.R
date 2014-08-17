
fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "tempdata.zip")
unzip("./tempdata.zip")

selected_data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

        selected_data <- selected_data[(selected_data$Date == "1/2/2007") | (selected_data$Date == "2/2/2007"),]
        selected_data$DateTime <- strptime(paste(selected_data$Date, selected_data$Time), "%d/%m/%Y %H:%M:%S")


## plot 1
 

  par(mfrow=c(1,1))
    png(filename = "plot1.png", width = 480, height = 480, units = "px", bg="transparent")
    hist(selected_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
    dev.off()


#############################################################