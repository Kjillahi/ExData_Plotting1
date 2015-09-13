# set working directory to my Exdata Folder
#setwd("Exdata_plotting1")
# load data to var my_data
my_data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
# Convert Date Column to character then to date format
my_data$Date <- as.character(my_data$Date)
my_data$Date <- as.Date(my_data$Date,"%d/%m/%Y")
# convert Time column to character then to Date as well
my_data$Time<- as.character(my_data$Time)
# select on usable data for ploting to var plot_dat
plot_dat <- subset(my_data,Date>="2007-02-01" & Date<="2007-02-02")
# convert the Global_active_power column to numeric
plot_dat$Global_active_power <- as.character(plot_dat$Global_active_power)
plot_dat$Global_active_power <- as.numeric(plot_dat$Global_active_power)
# convert the Voltage column to character then to numeric
plot_dat$Voltage <- as.character(plot_dat$Voltage)
plot_dat$Voltage <- as.numeric(plot_dat$Voltage)
# convert the Global Reactive Power column to character then to numeric
plot_dat$Global_reactive_power <- as.character(plot_dat$Global_reactive_power)
plot_dat$Global_reactive_power <- as.numeric(plot_dat$Global_reactive_power)
# convert the Submetering 1 column to character then to numeric
plot_dat$Sub_metering_1 <- as.character(plot_dat$Sub_metering_1)
plot_dat$Sub_metering_1 <- as.numeric(plot_dat$Sub_metering_1)
#convert the Submetering 2 column to character then to numeric
plot_dat$Sub_metering_2 <- as.character(plot_dat$Sub_metering_2)
plot_dat$Sub_metering_2 <- as.numeric(plot_dat$Sub_metering_2)
#Set Plotting Params
par(mfrow=c(2,2),mar=c(4,4,3,4))
#plot A different graph for each of the presentations with appropiriate params
#plot 1
with(plot_dat,plot(as.POSIXct(paste(plot_dat$Date,plot_dat$Time)),Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab = ""))
#plot 2
with(plot_dat,plot(as.POSIXct(paste(plot_dat$Date,plot_dat$Time)),Voltage,type="l",ylab = "Voltage",xlab = "datetime"))
#plot 3
with(plot_dat,plot(as.POSIXct(paste(plot_dat$Date,plot_dat$Time)),Sub_metering_1,type="n",ylab = "Energy Submetering",xlab = ""))
axis(side=2, at=seq(0, 30, by=10))
lines(as.POSIXct(paste(plot_dat$Date,plot_dat$Time)),plot_dat$Sub_metering_1,col="black", type = "l")
lines(as.POSIXct(paste(plot_dat$Date,plot_dat$Time)),plot_dat$Sub_metering_2,col="red", type = "l")
lines(as.POSIXct(paste(plot_dat$Date,plot_dat$Time)),plot_dat$Sub_metering_3,col="blue", type = "l")
legend("topright",lty=1,col = c("black","red","blue"),legend = c("Sub_metereting_1","Sub_metering_2","Sub_metering_3"),cex = 0.5,bty = "n")
#plot 4
with(plot_dat,plot(as.POSIXct(paste(plot_dat$Date,plot_dat$Time)),Global_reactive_power,type="l",ylab = "Global_reactive_power",xlab = "daytime"))
axis(side=2, at=seq(0.0,0.5, by=0.1))
#copy to plot4.png
dev.copy(png,file="plot4.png")
dev.off()


