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
# convert the Global_active_power column to character then to numeric
plot_dat$Global_active_power <- as.character(plot_dat$Global_active_power)
plot_dat$Global_active_power <- as.numeric(plot_dat$Global_active_power)
#plot A line graph of Active Power Column with ylabel="Global Active Power (kilowatts)"
with(plot_dat,plot(as.POSIXct(paste(plot_dat$Date,plot_dat$Time)),Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab = ""))
# copy plot to plot2.png
dev.copy(png,file="plot2.png")
dev.off()


