##read the data
powerdata <- read.table("household_power_consumption.txt",skip=1,sep=";")
##name the columns properly 
names(powerdata)<-c("Date","Time","Global_active_power","Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3")
##subset the data and select the right dates
subpowerdata<-subset(powerdata,powerdata$Date=="1/2/2007"|powerdata$Date=="2/2/2007")
##reformat the date and time properly for plotting
subpowerdata$Date<-as.Date(subpowerdata$Date,format="%d/%m/%Y")
subpowerdata$Time<-strptime(subpowerdata$Time,format="%H:%M:%S")
head(subpowerdata)
subpowerdata[1:1440,"Time"]<-format(subpowerdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpowerdata[1441:2880,"Time"]<-format(subpowerdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##make the plot and create the PNG file
png(file="plot4.png", width=480, height=480)
##initiate the multi-graph plot
par(mfrow=c(2,2))
with(subpowerdata,plot(subpowerdata$Time, Global_active_power, type="l",xlab="",ylab="Global Active Power"))
with(subpowerdata,plot(subpowerdata$Time, Voltage, type="l",xlab="datetime",ylab="Voltage"))
with(subpowerdata,plot(subpowerdata$Time, Sub_metering_1, type="l",xlab="",ylab="Energy sub metering"))
lines(subpowerdata$Time,subpowerdata$Sub_metering_2,type="l",col="red")
lines(subpowerdata$Time,subpowerdata$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,lwd=2,bty="n",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(subpowerdata,plot(subpowerdata$Time, Global_reactive_power,type="l",xlab="datetime",ylab="Gobal_reactive_power"))
dev.off()