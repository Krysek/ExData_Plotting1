
createPlot1 <- function () {
  ## Set environment on Windows
  # Sys.setlocale("LC_TIME", "English")
  
  ## Set environment on Unix/Mac OS X
  Sys.setlocale("LC_TIME", "en_US.UTF-8")
  
  ## If subdirectory "data" doesn't exists, then create this.
  if (!file.exists("data")) {
    dir.create("data")
  }
  
  ## If zip file isn't stored in subdirectory data, it will be downloaded.
  if (!file.exists("./data/household_power_consumption.zip")){
    fileURL                 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL, "./data/household_power_consumption.zip", method="curl")
    unzip ("./data/household_power_consumption.zip", exdir = "./data/")
  }
  
  ## Read Data between 1/2/2007 and 2/2/2007
  data_full <- read.table("./data/household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
  data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]
  
  ## Open graphics devices to png file
  png("plot1.png", width=480, height=480)
  
  ## Setup Plot
  par(mfrow=c(1,1), mar=c(5,5,2,1), oma=c(0,0,2,0))
  
  ## Create Plot 1
  hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.8)
  
  ## Close graphics devices
  dev.off()
}