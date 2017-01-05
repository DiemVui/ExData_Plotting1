powerdata<- read.csv2('household_power_consumption.txt', stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"), dec=".")

png(file = "plot4.png", bg = "transparent",width = 480, height = 480)

subdata <-subset(powerdata,Date=="1/2/2007" | Date=="2/2/2007")
Sys.setlocale("LC_TIME", "English")

subdata$Time = as.POSIXct(strptime(paste(subdata$Date, subdata$Time), format="%d/%m/%Y %H:%M:%S"), tz="UTC") #combine date time and convert to day of week
attach(mtcars)
par(mfrow=c(2,2))
plot(subdata$Time,as.numeric(subdata$Global_active_power)/500, type = "l",ylab = "Global Active Power(kilowatts)",xlab="")

plot(subdata$Time,as.numeric(subdata$Voltage), type = "l",ylab = "Voltage",xlab="")

plot(subdata$Time,as.numeric(subdata$Sub_metering_1), type = "l",ylab = "Energy Sub Metering",xlab="datetime")

lines(subdata$Time,as.numeric(subdata$Sub_metering_2), type = "l",ylab = "Energy Sub Metering",xlab="",col="red")
lines(subdata$Time,as.numeric(subdata$Sub_metering_3), type = "l",ylab = "Energy Sub Metering",xlab="",col="blue")
legend("topright",pch="-",col=c("black", "red", "blue"), legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))

plot(subdata$Time,as.numeric(subdata$Global_reactive_power), type = "l",ylab = "Global_reactive_power",xlab="datetime")

dev.off()