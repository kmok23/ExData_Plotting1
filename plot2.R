# This code take the Electric power consumption data from the zip file in the
# UC Irvine Machine Learning Repository, and makes the plot as requested in
# Course Project 1 of the Exploratory Data Analysis class.
#
# Data is from URL: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2F
# household_power_consumption.zip.
# Output is: plot2.png

# Call script to load data from zip file.
if (!exists("subdata")) {  # Checks if subsetted data has been populated
    source("loaddata.R")
}

png("plot2.png",  # Open PNG graphic device.
    width = 480,
    height = 480)

plot(subdata$DateTime,  # Plot Global Active Power against DateTime
     subdata$Global_active_power,
     axes = TRUE,
     ann = TRUE,
     typ = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()  # Close PNG graphic device.