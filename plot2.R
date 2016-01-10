#load the data
data<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=F)
#subset
use<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")
#convert the Date and Time variables to Date/Time classes
use<-data.frame(use,Datetime=strptime(paste(use$Dat,use$Time,sep=" "),"%d/%m/%Y %H:%M:%S"))

#plot
png(file="plot2.png")
plot(use$Datetime,use$Global_active_power,ylab="Global Active Power (kilowatt)",xlab="",type="l")
dev.off()