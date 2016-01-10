#load the data
data<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=F)
#subset
use<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")

#plot
png(file="plot1.png")
hist(use$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatt)",col="red")
dev.off()