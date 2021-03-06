## Project 1 - Plot1.R

## Library Used
library(dplyr)
library(stringr)
library(datasets)

## Read Dataset
setwd("~/Coursera/Exploratory-Data-Analysis")
household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#reformat to Date
household$DateTime <- strptime(paste(household$Date,household$Time),
                           format="%d/%m/%Y %H:%M:%S")

#subset data
plotdata <- subset(household, as.Date(Date, "%d/%m/%Y") >= as.Date("01/02/2007", "%d/%m/%Y") 
                   & as.Date(Date, "%d/%m/%Y") <= as.Date("02/02/2007", "%d/%m/%Y"))
rm(household)

# Start the png device
png(filename="plot4.png", height=480, width=480, bg="transparent")

# Create a 2x2 split

par(mfrow=c(2,2))

# Plot 1 - Upper Left Quadraint (Plot2.R)

with(plotdata,{
   plot(DateTime,
     Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")
})

# Plot 2 - voltage vs time - Upper Right Quadraint

with(plotdata, {
   plot(DateTime,
     Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")
})
# Plot 3 Lower Left Quadraint (Same as Plot3.R)


# Plot the line for Sub Meter 1
plot(plotdata$DateTime,
     plotdata$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy Sub Metering")

# Plot the line for Sub Meter 2
lines(plotdata$DateTime,
     plotdata$Sub_metering_2,
     type = "l",
     col = "red")

# Plot the line for Sub Meter 3
lines(plotdata$DateTime,
      plotdata$Sub_metering_3,
      type = "l",
      col = "blue")

# Add the legend
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),lwd=2,col=c("black","red","blue"))

# Plot 4 Lower Right Quadraint

with( plotdata, {
   plot(DateTime,
     Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")
})

# Save the figure
dev.off()