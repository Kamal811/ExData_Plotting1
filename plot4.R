##*************************** Read the file 
dfPowerData <-  read.table("PowerData\\household_power_consumption.txt" , sep = ";"
                           , stringsAsFactors = FALSE , header = TRUE,na.strings = "NA",
                           colClasses = c("character" , "character" , "numeric" , "numeric" , "numeric" ,"numeric","numeric","numeric","numeric"))

##*************************** Check the data
str(dfPowerData)
nrow(dfPowerData)

dfPowerData$Date <- as.Date(dfPowerData$Date , format = "%d/%m/%Y")

##*************************** Subset the data
dfPowerData <- subset(dfPowerData, (Date == as.Date("01-02-2007" , format = "%d-%m-%Y") )
                      | ( Date == as.Date("02-02-2007" , format = "%d-%m-%Y") ))

##*************************** Data Correction
dfPowerData$DayOfWeek <-  weekdays(dfPowerData$Date ,abbreviate = TRUE)
nrow(dfPowerData)


dfPowerData$DateTime <- as.POSIXlt(paste(dfPowerData$Date , dfPowerData$Time))


##*************************** Plotting
png("plot4.png" , width = 480 , height = 480)

par(mfrow = c(2,2))

#### Plot 1
plot(y= dfPowerData$Global_active_power, x = dfPowerData$DateTime  ,
     xlab = "" , ylab = "Global Active Power" , type = "l" )

## Plot 2

plot(y= dfPowerData$Voltage, x = dfPowerData$DateTime  ,
     xlab = "datetime" , ylab = "Voltage" , type = "l" )

## Plot 3

plot(y= dfPowerData$Sub_metering_1, x = dfPowerData$DateTime  ,
     xlab = "" , ylab = "Energy sub metering" , type = "n" )

lines(y = dfPowerData$Sub_metering_1 , x = dfPowerData$DateTime , col = "black" )
lines(y = dfPowerData$Sub_metering_2 , x = dfPowerData$DateTime , col = "red")
lines(y = dfPowerData$Sub_metering_3 , x = dfPowerData$DateTime , col = "blue")

legend("topright", c("Sub_metering_1"  ,"Sub_metering_2" ,"Sub_metering_3") , col = c("black" , "red" , "blue"), 
       lwd = c(1,1,1) , lty = c(1,1,1), inset = 0.00 , border = "white" , bty = "n" )


## plot 4

plot(y= dfPowerData$Global_reactive_power, x = dfPowerData$DateTime  ,
     xlab = "datetime" , ylab = "Global_reactive_power" , type = "l" )


dev.off()

