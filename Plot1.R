##Plot1.R
        library(dplyr)
        library(ggplot2)
        library(lattice)
        ##Read first 70000 rows
        plt<-read.csv("household_power_consumption.txt", sep=";",
                       nrow=70000, na.strings="?",
                       colClasses = c("character", "character","numeric",
                                      "numeric","numeric", "numeric",
                                      "numeric","numeric","numeric"))
        ##mutate Date to Date format
        plt<-mutate(plt, Date=as.Date(Date, format ="%d/%m/%Y"))
        ##Subset and plot histogram
        plt1<-subset(plt, plt$Date>="2007-02-01" & plt$Date<="2007-02-02")
        hist(plt1$Global_active_power, col = "red", 
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)")
        ##print png file
        dev.print(png, file="Plot1.png", width=480, height =480)
        dev.off()
        
        