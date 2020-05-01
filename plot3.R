dat <- read.table("./household_power_consumption.txt", header = TRUE, 
                  quote = "", sep = ";", stringsAsFactors = FALSE,
                  na.strings = "?")

first <- dat$Date == "1/2/2007"
second <- dat$Date == "2/2/2007"
dat <- subset(dat, first | second)
dat$Date <- as.Date(dat$Date, format = "%e/%m/%Y")
dat$Date_Time <- as.POSIXct(paste(dat$Date, dat$Time), 
                            format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)
plot(dat$Date_Time, dat$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(dat$Date_Time, dat$Sub_metering_2, col = "red")
lines(dat$Date_Time, dat$Sub_metering_3, col = "blue")
legend("topright", names(dat[,7:9]), col = c("black", "red", "blue"), lty = 1)
dev.off()