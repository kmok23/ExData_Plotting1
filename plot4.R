# This code take the Electric power consumption data from the zip file in the
# UC Irvine Machine Learning Repository, and makes the plot as requested in
# Course Project 1 of the Exploratory Data Analysis class.
#
# Data is from URL: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2F
# household_power_consumption.zip.
# Output is: plot4.png

# Call script to load data from zip file.
if (!exists("subdata")) {  # Checks if subsetted data has been populated
    source("loaddata.R")
}

png("plot4.png",  # Open PNG graphic device.
    width = 480,
    height = 480)

par(mfrow = c(2,2))  # Prepare PNG space for plots in 2 by 2 configuration.

plot(subdata$DateTime,  # First plot.
     subdata$Global_active_power,
     axes = TRUE,
     ann = TRUE,
     typ = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(subdata$DateTime,  # Second plot.
     subdata$Voltage,
     axes = TRUE,
     ann = TRUE,
     typ = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(subdata$DateTime,  # Third plot.
     subdata$Sub_metering_1,
     axes = TRUE,
     ann = TRUE,
     typ = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(subdata$DateTime,
      subdata$Sub_metering_2,
      col = "red")
lines(subdata$DateTime,
      subdata$Sub_metering_3,
      col = "blue")
legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       col = c("black", "red", "blue"),
       bty = "n")

plot(subdata$DateTime,  # Fourth plot.
     subdata$Global_reactive_power,
     axes = TRUE,
     ann = TRUE,
     typ = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()  # Close PNG graphic device.