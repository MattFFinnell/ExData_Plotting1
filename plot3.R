data_all <- read.csv("./data/household_power_consumption.txt", header=TRUE,
                     sep=';', na.strings="?", check.names=FALSE,
                     stringsAsFactors=FALSE, comment.char="", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subsetting to dates sepcified
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting date/time
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot
with(data, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()