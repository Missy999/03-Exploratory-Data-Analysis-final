NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
scclist2 <- as.data.frame(SCC[vehicles,1])
scclist2 <- apply(scclist2,1,as.character)
vehiclePM2.5 <- NEI[NEI$SCC %in% scclist2 & NEI$fips=="24510", ]
vehicletotal <- aggregate(vehiclePM2.5$Emissions,by=list(Year=vehiclePM2.5$year),FUN=sum)
png("plot5.png",width=480,height=480)
barplot(vehicletotal$x,xlab = "Year",ylab="Emissions ",main="Total Emission from  motor vehicle sources by Year in Baltimore",names.arg=c("1999", "2002","2005", "2008"))

dev.off()
