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

png("plot2.png" , width = 480 , height = 480)
plot(y= dfPowerData$Global_active_power, x = dfPowerData$DateTime  ,
        xlab = "" , ylab = "Global Active Power" , type = "l" )

dev.off()

