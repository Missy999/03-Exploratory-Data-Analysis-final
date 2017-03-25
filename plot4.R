NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal <- SCC[SCC$EI.Sector == "Fuel Comb - Comm/Institutional - Coal",]
scclist <- as.data.frame(coal[,1])
scclist <- apply(scclist,1,as.character)
coalPM2.5 <- NEI[NEI$SCC %in% scclist, ]
coaltotal <- aggregate(coalPM2.5$Emissions,by=list(Year=coalPM2.5$year),FUN=sum)
png("plot4.png",width=480,height=480)
barplot(coaltotal$x,xlab = "Year",ylab="Emissions ",main="Total Emission from coal combustion-related sources by Year",names.arg=c("1999", "2002","2005", "2008"))

dev.off()
