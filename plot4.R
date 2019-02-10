# read in the data
to_plot <- read.csv('/Users/brodyvogel/Desktop/household_power_consumption.txt', header=T, sep=';', na.strings="?")

# subset it
to_plot_1 <- subset(to_plot, Date %in% c("1/2/2007","2/2/2007"))
# reformat the date
to_plot_1$Date <- as.Date(to_plot_1$Date, format="%d/%m/%Y")
new_date <- paste(as.Date(to_plot_1$Date), to_plot_1$Time)
to_plot_1$New_Date <- as.POSIXct(new_date)

# get the multi-view
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
# and plot it
plot(Global_active_power ~ New_Date, type="l", data = to_plot_1,
       ylab="Global Active Power (kilowatts)", xlab="")
plot(Voltage ~ New_Date, type="l", data = to_plot_1,
       ylab="Voltage (volt)", xlab="")
plot(Sub_metering_1 ~ New_Date, type="l", data = to_plot_1,
       ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2 ~ New_Date, col='Red', data = to_plot_1)
lines(Sub_metering_2 ~ New_Date, col='Blue', data = to_plot_1)
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .4)
plot(Global_reactive_power ~ New_Date, type="l", data = to_plot_1,
       ylab="Global Rective Power (kilowatts)", xlab="")