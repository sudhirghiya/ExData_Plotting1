# Read Data.
# Clean Data

source("getdata.R")

# We will use the clean dataset to generate graphs
# Plot4
## Generating Plot 4

dev.new()

par(mfrow = c(2, 2))

# Subplot 1 
plot(energydata$Datetime, energydata$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# Subplot 2
plot(energydata$Datetime, energydata$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# Subplot 3
plot(energydata$Datetime, energydata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
points(energydata$Datetime, energydata$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2",  col = "red")
points(energydata$Datetime, energydata$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n" )

# Subplot 4
plot(energydata$Datetime, energydata$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
