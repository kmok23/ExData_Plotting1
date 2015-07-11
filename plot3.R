# This code take the Electric power consumption data from the zip file in the
# UC Irvine Machine Learning Repository, and makes the plot as requested in
# Course Project 1 of the Exploratory Data Analysis class.
#
# Data is from URL: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2F
# household_power_consumption.zip.
# Output is: plot3.png

# Call script to load data from zip file.
if (!exists("subdata")) {  # Checks if subsetted data has been populated
    source("loaddata.R")
}

png("plot3.png",  # Open PNG graphic device.
    width = 480,
    height = 480)

plot(subdata$DateTime,  # Plot Sub_metering_1 against DateTime
     subdata$Sub_metering_1,
     axes = TRUE,
     ann = TRUE,
     typ = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(subdata$DateTime,  # Add Sub_metering_2
      subdata$Sub_metering_2,
      col = "red")
lines(subdata$DateTime,  # Add Sub_metering_3
      subdata$Sub_metering_3,
      col = "blue")
legend(x = "topright",  # Add legend
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       col = c("black", "red", "blue"))

dev.off()  # Close PNG graphic device.