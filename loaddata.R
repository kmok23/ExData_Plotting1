# Download the zip file, unzip, and read data.
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(url, temp)


# This code reads the file line by line, then constructs the data frame. This
# method yielded the best overall performance.
#
conn <- unz(temp,"household_power_consumption.txt")
txt <- readLines(conn)
close(conn)

indices <- grepl("^1/2/2007|^2/2/2007", txt)  # Get indices where dates match
data <- txt[indices]  # Extract text for those dates

fieldList <- strsplit(data, split = ";")  # Split text into separated data
M <- matrix(unlist(fieldList), nrow = length(fieldList), byrow = TRUE)
subdata <- as.data.frame(M, stringsAsFactors = FALSE)

colnames(subdata) <- unlist(strsplit(txt[1], split = ";"))
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
subdata$Global_reactive_power <- as.numeric(subdata$Global_reactive_power)
subdata$Voltage <- as.numeric(subdata$Voltage)
subdata$Global_intensity <- as.numeric(subdata$Global_intensity)
subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)

# Create a new variable by combining Date and Time into a POSIX variable
subdata$DateTime <- strptime(paste(subdata$Date,
                                subdata$Time,
                                sep = " "),
                          "%d/%m/%Y %H:%M:%S")

rm(indices, data, fieldList, M, txt)  # Clean up
# user:17.58 / system:0.13 / elapsed:32.67
# user:17.94 / system:0.42 / elapsed:28.75



# This code uses read.table to read the data from the file, but passes column
# classes arguments. The column classes are found by reading the first few
# lines of the file first, parsing the classes, then reading the rest of the
# file with the column classes defined.
#
# first3rows <- read.table(unz(temp,"household_power_consumption.txt"),
#                    header = TRUE,
#                    stringsAsFactors = FALSE,
#                    nrows = 3,
#                    sep = ";")
# classes <- sapply(first3rows, class)
# data <- read.table(unz(temp,"household_power_consumption.txt"),
#                    header = TRUE,
#                    stringsAsFactors = FALSE,
#                    colClasses = classes,
#                    na.strings = "?",
#                    sep = ";")
# user:21.58 / system:0.33 / elapsed:32.06
# user:21.40 / system:0.03 / elapsed:38.98 

# Subset data based on the date.
# subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")



# This code uses read.table to read the data from the file.
#
# data <- read.table(unz(temp,"household_power_consumption.txt"),
#                    header = TRUE,
#                    stringsAsFactors = FALSE,
#                    na.strings = "?",
#                    comment.char = "",
#                    sep = ";")
# user:23.01 / system:0.21 / elapsed:26.85
# user:22.98 / system: 0.08 / elapsed:85.26 
