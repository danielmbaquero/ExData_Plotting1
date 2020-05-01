dat <- read.table("./household_power_consumption.txt", header = TRUE, 
                  quote = "", sep = ";", stringsAsFactors = FALSE,
                  na.strings = "?")

first <- dat$Date == "1/2/2007"
second <- dat$Date == "2/2/2007"
dat <- subset(dat, first | second)
dat$Date <- as.Date(dat$Date, format = "%e/%m/%Y")
dat$Date_Time <- as.POSIXct(paste(dat$Date, dat$Time), 
                            format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(dat$Date_Time, dat$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")
plot(dat$Date_Time, dat$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")
plot(dat$Date_Time, dat$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(dat$Date_Time, dat$Sub_metering_2, col = "red")
lines(dat$Date_Time, dat$Sub_metering_3, col = "blue")
legend("topright", names(dat[,7:9]), col = c("black", "red", "blue"), 
       lty = 1, bty = "n")
plot(dat$Date_Time, dat$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
