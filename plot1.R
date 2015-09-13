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
#plot Histogram with red fill and xlabel="Global Active Power"
hist(plot_dat$Global_active_power,col = "red",xlab = "Global Active Power(kilowatts)",main="Global Active Power")
# copy to png file plot1.png
dev.copy(png,file="plot1.png")
dev.off()

