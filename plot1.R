
dfPowerData <-  read.table("PowerData\\household_power_consumption.txt" , sep = ";"
                           , stringsAsFactors = FALSE , header = TRUE,na.strings = "NA",
                           colClasses = c("character" , "character" , "numeric" , "numeric" , "numeric" ,"numeric","numeric","numeric","numeric"))

str(dfPowerData)
nrow(dfPowerData)

dfPowerData$Date <- as.Date(dfPowerData$Date , format = "%d/%m/%Y")

dfPowerData <- subset(dfPowerData, (Date == as.Date("01-02-2007" , format = "%d-%m-%Y") )
       | ( Date == as.Date("02-02-2007" , format = "%d-%m-%Y") ))

nrow(dfPowerData)

View(dfPowerData)

hist(dfPowerData$Global_active_power , col = "Red" 
     , main = "Global Active Power" , xlab = "Global Active Power (kilowatts)" , ylab = "Frequency")

