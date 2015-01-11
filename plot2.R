data_all <- read.csv("./data/household_power_consumption.txt", header=TRUE,
                     sep=';', na.strings="?", check.names=FALSE,
                     stringsAsFactors=FALSE, comment.char="", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subsetting to dates sepcified
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting date/time
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##Plot
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()