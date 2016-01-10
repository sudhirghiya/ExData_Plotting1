# Read Data
# Clean Data

source("getdata.R")

# We will use the clean dataset to generate graphs

dev.new()
hist(energydata$Global_active_power, 
     col = "red", 
     main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
