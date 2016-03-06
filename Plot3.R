##Plot3.R
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
        
        ##print png file
        png(file="Plot3.png")    
        
        ##Plot XY
        plot(plt2$Date_Time, plt2$Sub_metering_1, type ="l",
             xlab = "", ylab="Energy sub metering")
        
        ##add lines
        lines(plt2$Date_Time,plt2$Sub_metering_2,col="red")
        lines(plt2$Date_Time,plt2$Sub_metering_3,col="blue")
        
        ##add legend
        legend("topright", legend= c("Sub_metering_1","Sub_metering_2",
                                     "Sub_metering_3"),
               lty=c(1,1), col = c("black","red","blue"))

        ##close dev
        dev.off()
        
        ##reset LC_TIME
        Sys.setlocale("LC_TIME", "Danish")
        