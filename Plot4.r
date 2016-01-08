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
    
#Make Plot 4 
  #Set Output Device
  png("plot4.png", width = 480, height = 480)
  
  #Set plot parameters and capture current defaults in variable
  plotpar<- par(mfrow = c(2,2), oma = c(0,1,1,0), mar=c(5,3.8,2,1.5))
  
  #Global Active Power
  plot(HHPC$Global_active_power, type="l", axes=FALSE, ann=FALSE)
  box()
  caxis = 1
  axis(1, at=1  ,lab="Thu", cex.axis=caxis)
  axis(1, at=1441  ,lab="Fri", cex.axis=caxis)
  axis(1, at=2880  ,lab="Sat", cex.axis=caxis)
  axis(2, at= c(0,2,4,6), cex.axis=caxis)
  title(ylab="Global Active Power",cex.lab=caxis)
    
  #Voltage
  plot(HHPC$Voltage, type="l", axes=FALSE, ann=FALSE,  ylim=c(234,246), cex.lab=0.6)
  box()
  axis(1, at=1  ,lab="Thu", cex.axis=caxis)
  axis(1, at=1441  ,lab="Fri", cex.axis=caxis)
  axis(1, at=2880  ,lab="Sat", cex.axis=caxis)
  axis(2, at= 2*c(117:123), cex.axis=caxis)
  title(ylab="Voltage", xlab="datetime",cex.lab=caxis)
	
  #Submeters
  plot(HHPC$Sub_metering_1, type="l", axes=FALSE, ann=FALSE)
  lines(HHPC$Sub_metering_2, type="l", col="red")
  lines(HHPC$Sub_metering_3, type="l", col="blue")
  axis(1, at=1  ,lab="Thu", cex.axis=caxis)
  axis(1, at=1441  ,lab="Fri", cex.axis=caxis)
  axis(1, at=2880  ,lab="Sat", cex.axis=caxis)
  axis(2, at= c(0,10,20,30), cex.axis=caxis)
  title(ylab="Energy sub metering",cex.lab=caxis)
  legend(1100, 39, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=caxis-0.1, col=c("black","red","blue"), lty=1, bty="n");
  box()
  
  #Global Reactive Power
  plot(HHPC$Global_reactive_power, type="l", axes=FALSE, ann=FALSE)
  box()
  axis(1, at=1  ,lab="Thu", cex.axis=caxis)
  axis(1, at=1441  ,lab="Fri", cex.axis=caxis)
  axis(1, at=2880  ,lab="Sat", cex.axis=caxis)
  axis(2, at= c(0.0,0.1,0.2,0.3,0.4,0.5), cex.axis=caxis-.04)
  title(ylab="Global_reactive_power", xlab="datetime", cex.lab=caxis)
  
  #restore default parameters back
  par(plotpar)
  #Close file
  dev.off()