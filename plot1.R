dat <- read.table("./household_power_consumption.txt", header = TRUE, 
                  quote = "", sep = ";", stringsAsFactors = FALSE,
                  na.strings = "?")

first <- dat$Date == "1/2/2007"
second <- dat$Date == "2/2/2007"
dat <- subset(dat, first | second)

png(filename = "plot1.png", width = 480, height = 480)
hist(dat$Global_active_power, xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")
dev.off()
