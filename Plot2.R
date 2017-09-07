## Loading the data
## seperate ";"
mydata <- read.table(file="data/household_power_consumption.txt", header = TRUE, sep=";")
head(mydata)  ## data verify
summary(mydata)
sapply(head(mydata,1), class) # all data's type are factor except sub_metering_3

# filter between 2007-02-01 and 2007-02-02
mydata_0201_0202 <- subset(mydata, 
                    as.Date(strptime(Date, format="%d/%m/%Y")) == as.Date("2007-02-01") |
                    as.Date(strptime(Date, format="%d/%m/%Y")) == as.Date("2007-02-02"))
mydata_0201_0202$Global_active_power <- as.numeric(as.character(mydata_0201_0202$Global_active_power))

##########################################################

# plot 2

# make date field combined by col1, col2
mydata_0201_0202[[10]] <- paste(mydata_0201_0202$Date, mydata_0201_0202$Time)
mydata_0201_0202[[10]] <- strptime(mydata_0201_0202[[10]], format="%d/%m/%Y %H:%M:%S")
names(mydata_0201_0202)[10] <- c("Date2")

# print Graph
plot(mydata_0201_0202$Date2, mydata_0201_0202$Global_active_power, type='l', 
     xlab = "", ylab = "Global Active Power(kilowatts)")
