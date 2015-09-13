# set working directory to my Exdata Folder
#setwd("Exdata_plotting1")
# load data to var my_data
my_data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
# Convert Date Column to character then to date format
my_data$Date <- as.character(my_data$Date)
my_data$Date <- as.Date(my_data$Date,"%d/%m/%Y")
# convert Time column to character then to Date 
my_data$Time<- as.character(my_data$Time)
# select on usable data for ploting to var plot_dat
plot_dat <- subset(my_data,Date>="2007-02-01" & Date<="2007-02-02")
# convert the Sum_metering_1 column to character then to numeric
plot_dat$Sub_metering_1 <- as.character(plot_dat$Sub_metering_1)
plot_dat$Sub_metering_1 <- as.numeric(plot_dat$Sub_metering_1)
#convert the Sub_metering_2 column to character then to numeric
plot_dat$Sub_metering_2 <- as.character(plot_dat$Sub_metering_2)
plot_dat$Sub_metering_2 <- as.numeric(plot_dat$Sub_metering_2)
#plot A line graph without any line with  ylabel="Energy Submetering" then add lines,legends,yaxis frequency
with(plot_dat,plot(as.POSIXct(paste(plot_dat$Date,plot_dat$Time)),Sub_metering_1,type="n",ylab = "Energy Submetering",xlab = ""))
axis(side=2, at=seq(0, 30, by=10))
lines(as.POSIXct(paste(plot_dat$Date,plot_dat$Time)),plot_dat$Sub_metering_1,col="black", type = "l")
lines(as.POSIXct(paste(plot_dat$Date,plot_dat$Time)),plot_dat$Sub_metering_2,col="red", type = "l")
lines(as.POSIXct(paste(plot_dat$Date,plot_dat$Time)),plot_dat$Sub_metering_3,col="blue", type = "l")
legend("topright",lty=1,col = c("black","red","blue"),legend = c("Sub_metereting_1","Sub_metering_2","Sub_metering_3"))
#copy to plot3.png
dev.copy(png,file="plot3.png")
dev.off()


