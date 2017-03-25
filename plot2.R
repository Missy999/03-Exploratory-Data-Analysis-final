NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Balt <- subset(NEI, NEI$fips=="24510")
baltPM2.5 <- aggregate(Balt$Emissions,by=list(Year=Balt$year),FUN=sum)
str(baltPM2.5)
png("plot2.png",width=480,height=480)
plot(baltPM2.5$Year,baltPM2.5$x,type="o",xlab = "Year",ylab="Emissions",main="PM2.5 Emission by Year of Baltimore")

dev.off()
