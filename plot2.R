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
png(file="plot2.png", width=480, height=480)
plot(subpowerdata$Time,as.numeric(as.character(subpowerdata$Global_active_power)),type="l", xlab="",ylab="Glaobal Active Power(kilowatts)")

dev.off()
