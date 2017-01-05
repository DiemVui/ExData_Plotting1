powerdata <- read.table("household_power_consumption.txt" ,header = T,sep=";" )
png(file = "plot3.png", bg = "transparent",width = 480, height = 480)

subdata <-subset(powerdata,Date=="1/2/2007" | Date=="2/2/2007")
Sys.setlocale("LC_TIME", "English")

subdata$Time = as.POSIXct(strptime(paste(subdata$Date, subdata$Time), format="%d/%m/%Y %H:%M:%S"), tz="UTC") #combine date time and convert to day of week

plot(subdata$Time,as.numeric(subdata$Sub_metering_1), type = "l",ylab = "Energy Sub Metering",xlab="")
lines(subdata$Time,as.numeric(subdata$Sub_metering_2),ylab = "Energy Sub Metering",xlab="",col="red")
lines(subdata$Time,as.numeric(subdata$Sub_metering_3),ylab = "Energy Sub Metering",xlab="",col="blue")
legend("topright",pch="-",col=c("black", "red", "blue"), legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))

dev.off()