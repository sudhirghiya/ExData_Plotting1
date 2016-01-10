library(httr)

#
# We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data 
# from just those dates rather than reading in the entire dataset and subsetting to those dates.
#

  if (!file.exists("data"))  # Check if data folder exists in getwd()
  { 
    dir.create("data")       # Create it if not available.
  }    

# 
# Read Data File as given in Project Paper.
# Mandatory data folder exists in getwd() folder.
# 
 downloadfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
 zipfile      <- "./data/exdata_data_household_power_consumption.zip"
 zipdir       <- "./data"
 datafile     <- "./data/household_power_consumption.txt"
#
 if (!file.exists(zipfile)) {
   download.file(downloadfile, destfile=zipfile, cacheOK=TRUE, mode="wb", method="auto")
   if (file.exists(zipfile)) {
#     filelist<-unzip(zipfile, overwrite=TRUE, list=TRUE, exdir=zipdir)
     unzip(zipfile, overwrite=TRUE, exdir=zipdir)
   }
 } 

#  
# Specs for Data File.
# 
# The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
#  Date: Date in format dd/mm/yyyy
#  Time: time in format hh:mm:ss
#  Global_active_power: household global minute-averaged active power (in kilowatt)
#  Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#  Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). 
#                 It corresponds to the kitchen, containing mainly a dishwasher, 
#                 an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). 
#                 It corresponds to the laundry room, containing a washing-machine, 
#                 a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). 
#                 It corresponds to an electric water-heater and an air-conditioner.
#
  fh<-file(datafile)   # Create a File Handle for the datafile; 

# Readlines from datafile using File handle(fh) and inline perform a pattern search using grep.
  
  energydata <- read.table(text = grep("^[1,2]/2/2007", readLines(fh), value = TRUE), 
                           sep = ";", 
                           col.names = c("Date", 
                                         "Time", 
                                         "Global_active_power", 
                                         "Global_reactive_power", 
                                         "Voltage", 
                                         "Global_intensity", 
                                         "Sub_metering_1", 
                                         "Sub_metering_2", 
                                         "Sub_metering_3"),  
                           colClasses= c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                           header = TRUE,
                           na="?")

# 1. convert Date Column to Date class
energydata$Date <- as.Date(energydata$Date, format = "%d/%m/%Y")

# 2. Add DateTime Column with DAte & Time in datetime format
datetime <- paste(as.Date(energydata$Date), energydata$Time)   # Temporary
energydata$Datetime <- as.POSIXct(datetime)
rm(datetime)