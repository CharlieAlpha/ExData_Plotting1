#Set working directory, if needed
 #setwd("C:\\Scratch\\_coursera\\Class4")

#Install package and download data. Uncomment to execute
 # install.packages("downloader")
 # require(downloader)
 # url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
 # download(url, "HHPC.zip")
 # unzip("HHPC.zip")

#Import Data Set
  #Select only data from 2007-02-01 and 2007-02-02
  HHPC <- read.table(".\\household_power_consumption.txt", header = FALSE, sep = ";", skip=66637, nrows=2880)   
  #Build Column Name vector
  colnames(HHPC) <- c("Date"
	,"Time"
	,"Global_active_power"
	,"Global_reactive_power"
	,"Voltage"
	,"Global_intensity"
	,"Sub_metering_1"
	,"Sub_metering_2"
	,"Sub_metering_3")
  #Transform columns to correct format
  HHPC<-transform(HHPC, Date = as.Date(Date,"%d/%m/%Y"))
  HHPC<-transform(HHPC, Global_active_power = as.numeric(Global_active_power))

  
#Make Plot 2  
  #Set Output Device
  png("plot2.png", width = 480, height = 480)
  
  #Plot Basic Line
  plot(HHPC$Global_active_power, type="l", axes=FALSE, ann=FALSE)
  # Create box
  box()
  #X Axis
  axis(1, at=1  ,lab="Thu")
  axis(1, at=1441  ,lab="Fri")
  axis(1, at=2880  ,lab="Sat")
  #Y Axis
  axis(2, at= c(0,2,4,6))
  #Set title
  title(ylab="Global Active Power (kilowatts)")
  #Close file
  dev.off()