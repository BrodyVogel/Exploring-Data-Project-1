# read in the data
to_plot <- read.csv('/Users/brodyvogel/Desktop/household_power_consumption.txt', header=T, sep=';', na.strings="?")

# subset it
to_plot_1 <- subset(to_plot, Date %in% c("1/2/2007","2/2/2007"))
# reformat the date
to_plot_1$Date <- as.Date(to_plot_1$Date, format="%d/%m/%Y")
# and show the histogram
hist(to_plot_1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")