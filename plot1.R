## Project 1 - Plot1.R

## Library Used
library(dplyr)
library(stringr)
library(datasets)

## Read Dataset
setwd("~/Coursera/Exploratory-Data-Analysis")
household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#reformat to Date
household$Date <- as.Date(household$Date, "%d/%m/%Y")

#subset data
plotdata <- filter(household, as.Date(Date, "%d/%m/%Y") >= as.Date("01/02/2007", "%d/%m/%Y") 
                   & as.Date(Date, "%d/%m/%Y") <= as.Date("02/02/2007", "%d/%m/%Y"))
rm(household)

# Start the png device
png(filename="plot1.png", height=480, width=480, bg="transparent")

# Plot the histogram
hist(plotdata$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

# Save the figure
dev.off()