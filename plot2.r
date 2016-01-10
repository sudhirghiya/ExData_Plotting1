# Read Data
# Clean Data

source("getdata.R")

dev.new()
# We will use the clean dataset to generate graphs
plot(energydata$Global_active_power ~ energydata$Datetime, 
     type = "l",
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

