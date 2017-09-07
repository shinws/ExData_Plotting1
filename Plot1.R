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

# plot 1
par(mar=c(4,4,2,2))
hist(mydata_0201_0202$Global_active_power, 
     col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")

