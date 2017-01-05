powerdata <- read.table("household_power_consumption.txt" ,header = T,sep=";" )

subdata <-subset(powerdata,Date=="1/2/2007" | Date=="2/2/2007")

png(file = "plot2.png", bg = "transparent",width = 480, height = 480)
Sys.setlocale("LC_TIME", "English")

subdata$Time = as.POSIXct(strptime(paste(subdata$Date, subdata$Time), format="%d/%m/%Y %H:%M:%S"), tz="UTC") #combine date time and convert to day of week
plot(subdata$Time,as.numeric(subdata$Global_active_power)/500, type = "l",ylab = "Global Active Power(kilowatts)",xlab="")


dev.off()