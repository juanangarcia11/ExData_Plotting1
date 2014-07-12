## Download the file, and unzip data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "exdata-data-household_power_consumption", method="auto")
unzip("exdata-data-household_power_consumption.zip")

##read and load data, assuming on same directory
##read only data for the two selected days
##as we need two days data, with samples every minute, 2days x 24h x 60min = 2880 rows to read


Data <- read.table ("./household_power_consumption.txt",header=FALSE,sep=";",nrows=2880, skip=66637)
colnames(Data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
##join Date and Time columns into a single value
Days<-strptime(paste(Data$Date,Data$Time),"%d/%m/%Y %H:%M:%S")


##open png device, create graph and close it
png("plot3.png")
with(Data, plot(Days,Data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"),asp=1)
with(Data, points(Days,Data$Sub_metering_2,type="l",col="red"))
with(Data, points(Days,Data$Sub_metering_3,type="l",col="blue"))
legend ("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
