#load the data
data<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=F)
#subset
use<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")
#convert the Date and Time variables to Date/Time classes
use<-data.frame(use,Datetime=strptime(paste(use$Dat,use$Time,sep=" "),"%d/%m/%Y %H:%M:%S"))

#plot
png(file="plot4.png")
#set the mfrow
par(mfrow=c(2,2))

#plot1
plot(use$Datetime,use$Global_active_power,ylab="Global Active Power",xlab="",type="l")

#plot2
plot(use$Datetime,use$Voltage,ylab="Voltage",xlab="",type="l")

#plot3
plot(use$Datetime,use$Sub_metering_1,ylab="Energy Sub Metering",xlab="",type="n")
lines(use$Datetime,use$Sub_metering_1,col="black")
lines(use$Datetime,use$Sub_metering_2,col="red")
lines(use$Datetime,use$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

#plot4
plot(use$Datetime,use$Global_reactive_power,ylab="Global Reactive Power",xlab="",type="l")

dev.off()