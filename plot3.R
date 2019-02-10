# read in the data
to_plot <- read.csv('/Users/brodyvogel/Desktop/household_power_consumption.txt', header=T, sep=';', na.strings="?")

# subset it
to_plot_1 <- subset(to_plot, Date %in% c("1/2/2007","2/2/2007"))
# reformat the date
to_plot_1$Date <- as.Date(to_plot_1$Date, format="%d/%m/%Y")
new_date <- paste(as.Date(to_plot_1$Date), to_plot_1$Time)
to_plot_1$New_Date <- as.POSIXct(new_date)

# and plot it
plot(Sub_metering_1 ~ New_Date, type="l", data = to_plot_1,
       ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2 ~ New_Date, col='Red', data = to_plot_1)
lines(Sub_metering_3 ~ New_Date, col='Blue', data = to_plot_1)
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .5)