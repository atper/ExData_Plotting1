#load the data
data<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=F)
#subset
use<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")
#convert the Date and Time variables to Date/Time classes
use<-data.frame(use,Datetime=strptime(paste(use$Dat,use$Time,sep=" "),"%d/%m/%Y %H:%M:%S"))

#plot
png(file="plot3.png")
#open an empty plot
plot(use$Datetime,use$Sub_metering_1,ylab="Energy Sub Metering",xlab="",type="n")

#add three lines
lines(use$Datetime,use$Sub_metering_1,col="black")
lines(use$Datetime,use$Sub_metering_2,col="red")
lines(use$Datetime,use$Sub_metering_3,col="blue")

#set legend
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()