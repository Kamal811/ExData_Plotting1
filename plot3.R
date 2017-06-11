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

png("plot3.png" , width = 480 , height = 480)

plot(y= dfPowerData$Sub_metering_1, x = dfPowerData$DateTime  ,
     xlab = "" , ylab = "Energy sub metering" , type = "n" )

lines(y = dfPowerData$Sub_metering_1 , x = dfPowerData$DateTime , col = "black" )
lines(y = dfPowerData$Sub_metering_2 , x = dfPowerData$DateTime , col = "red")
lines(y = dfPowerData$Sub_metering_3 , x = dfPowerData$DateTime , col = "blue")

legend("topright", c("Sub_metering_1"  ,"Sub_metering_2" ,"Sub_metering_3") , col = c("black" , "red" , "blue"), 
       lwd = c(1,1,1) , lty = c(1,1,1), inset = 0.00 )

dev.off()

