NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## 1. Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
total <- aggregate(NEI$Emissions,by=list(Year=NEI$year),FUN=sum)
str(total)
png("plot1.png",width=480,height=480)
barplot(total$x,xlab = "Year",ylab="Emissions",main="Total Emission by Year",names.arg=c("1999", "2002","2005", "2008"))

dev.off()
