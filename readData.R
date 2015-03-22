readData <- function () {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(fileUrl, "data.zip")
  unzip("data.zip")
  
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  NEI$fips <- as.factor(NEI$fips)
  NEI$SCC <- as.factor(NEI$SCC)
  NEI$Pollutant <- as.factor(NEI$Pollutant)
  NEI$type <- as.factor(NEI$type)
}
