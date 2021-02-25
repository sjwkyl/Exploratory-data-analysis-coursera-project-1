##read the data
powerdata <- read.table("household_power_consumption.txt",skip=1,sep=";")
head(powerdata)
##name the columns properly 
names(powerdata)<-c("Date","Time","Global_active_power","Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3")
head(powerdata)
##subset the data and select the right dates
subpowerdata<-subset(powerdata,powerdata$Date=="1/2/2007"|powerdata$Date=="2/2/2007")
head(subpowerdata)
##make the histogram and create the PNG file
png(file="plot1.png", width=480, height=480)
hist(as.numeric(as.character(subpowerdata$Global_active_power)),col="red",main="Global Active Power", xlab="Global Active Power(kilowatts)",ylab="Frequency")

dev.off()