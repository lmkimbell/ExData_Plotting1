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
png(filename="plot2.png", height=480, width=480, bg="transparent")

# Plot the line
with(plotdata, {
   plot(DateTime,
     Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
})

# Save the figure
dev.off()