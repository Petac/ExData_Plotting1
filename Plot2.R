##Plot2.R
        library(dplyr)
        library(ggplot2)
        library(lattice)
        
        ##Read first 70000 rows
        plt<-read.csv("household_power_consumption.txt", sep=";",
                       nrow=70000, na.strings="?",
                       colClasses = c("character", "character","numeric",
                                      "numeric","numeric", "numeric",
                                      "numeric","numeric","numeric"))
        
        ##generate Date and Time format
        plt$new1<-paste(plt$Date, plt$Time, sep =" ")
        plt$Date_Time<-strptime(plt$new1 , format ="%d/%m/%Y %H:%M:%S")
        
        ##subsetting
        plt2<-subset(plt, plt$Date_Time>="2007-02-01" &
                             plt$Date_Time<="2007-02-02 23:59:00")
        
        
        ##Change LC_TIME to generate tickmarks in English
        Sys.setlocale("LC_TIME", "English")
        ##Plot XY
        plot(plt2$Date_Time,plt2$Global_active_power, type ="l",
             xlab = "", ylab="Global Active Power (kilowatts)")
        
        ##print png file
        dev.print(png, file="Plot2.png", width=480, height =480)
        dev.off()
        
        ##reset LC_TIME
        Sys.setlocale("LC_TIME", "Danish")
        